import os
import os.path
import subprocess
from datetime import datetime

from django.core.management.base import BaseCommand
from git import Git

from finder_rules.models import Group, Rule, Test


class Command(BaseCommand):
    args = ''
    help = ''

    def handle(self, *args, **options):
        self.find_rules(*args)

    # Получение ссылки в качестве аргумента
    def add_arguments(self, parser):
        parser.add_argument(
            nargs=3,
            type=str,
            dest='args'
        )

    def find_rules(self, *args):
        # print(args[0])  # group name (group id)
        # print(args[1])  # path (v1-dir_name; v2-git_link; v3-repl_link)
        # args[2]            test id

        # cur_dir = os.path.dirname(
        #     'C:\\Users\\user\\Documents\\projects\\finder_rules\\finder_rules_web\\projects\\' + args[1]
        # )
        # cur_dir = 'C:\\Users\\user\\Documents\\projects\\finder_rules\\finder_rules_web\\projects\\' + args[1] + '\\'
        # cur_dir = os.path.dirname(os.getcwd() + '/projects/' + args[1] + '/')
        cur_dir = os.path.dirname(os.getcwd() + '/projects/')

        if('repl.it' in args[1]):
            project_name = args[1].split('/')[-2]
            proj_from_repl = self.get_proj_from_repl(
                cur_dir + '/' + project_name, args[1])
            cur_dir = proj_from_repl
        else:
            try:
                Git(cur_dir).clone(args[1])
            except Exception:
                pass
            project_name = args[1].split('/')[-1].split('.')[0]
            cur_dir += '/' + project_name

        dir_list = [x[0] for x in os.walk(cur_dir)]
        with open(f'{cur_dir}/res{datetime.now().strftime("%Y-%m-%d-%H.%M.%S.%f")}.txt', 'a+') as res_file:
            text = f'{Group.objects.get(id=args[0])} '
            text += f'{args[1]} '
            text += f'{str(datetime.now())}\n'

            text += self.test_sys(dir_list, args[0])

            text += self.check_style(cur_dir, 'Main.java')

            # if(type(proj_from_repl) is str or proj_from_repl == 3):
            text += self.run_program(cur_dir, 'Main.java')

            res_file.write(text)
            test = Test.objects.filter(id__exact=int(args[2]))
            test.update(result=text)

    def get_proj_from_repl(self, dir_name, url):
        extract_ex = '.zip'
        dir_name_proj = url.split('/')[-1]

        dowloading = subprocess.run(
            ['wget', '-q', '-P', dir_name, url+extract_ex, '-nc'])

        if(dowloading.returncode):
            # print('Error download')
            return 1
        else:
            unzipping = subprocess.run(
                ['unzip', '-qo', dir_name+'/'+dir_name_proj+extract_ex, '-d', dir_name+'/'+dir_name_proj])

            if(unzipping.returncode):
                # print('Error unzip')
                return 2
            else:
                remove_zip = subprocess.run(
                    ['rm', dir_name+'/'+dir_name_proj+extract_ex])

                if(remove_zip.returncode):
                    # print('Error remove')
                    return 3
                else:
                    return dir_name+'/'+dir_name_proj

    def test_sys(self, dir_list, group_id):
        text = ''

        try:
            # group_id = Group.objects.get(name__iexact=args[0]).id
            # rules = Rule.objects.filter(group_id__exact=group_id)
            rules = Rule.objects.filter(group_id__exact=int(group_id))

            for rule in rules:
                global is_rule
                is_rule = False
                for dir_path in dir_list:
                    file_list = os.listdir(dir_path)
                    for file_name in file_list:
                        if '.' in file_name:
                            file_extension = file_name.split('.')[-1]

                            if file_extension and file_extension in rule.file_types:
                                with open(f'{dir_path}/{file_name}', 'r') as file:
                                    try:
                                        file_text = file.read().lower()
                                        if rule.search_text and rule.search_text.lower() in file_text:
                                            is_rule = True
                                            break
                                    except Exception:
                                        print(
                                            f'Error in {dir_path}/{file_name}')
                    if is_rule:
                        break
                if is_rule:
                    text += f'{rule} passed\n'
                else:
                    text += f'{rule} NOT passed'
                    if rule.recommendation:
                        text += f' Recommendation: {rule.recommendation}\n'
                    else:
                        text += '\n'

        except Exception:
            text += 'Error get rules\n'

        return text

    def run_program(self, dir_name, file_name):
        compile_program = subprocess.Popen(
            ['javac', '-sourcepath', dir_name, dir_name+'/'+file_name], stdout=subprocess.PIPE)

        if(compile_program.returncode):
            return f'Compile:\n{compile_program.stdout.read().decode("utf-8")}'
        else:
            run_program = subprocess.Popen(
                ['java', '-classpath', dir_name, (file_name.split('.')[0])], stdout=subprocess.PIPE)
            return f'Compile:\n{compile_program.stdout.read().decode("utf-8")}\nOut program:\n{run_program.stdout.read().decode("utf-8") }'

    def check_style(self, dir_name, file_name):
        check = subprocess.Popen(
            [
                'java',
                '-jar',
                './finder_rules/management/commands/checkstyle-8.29-all.jar',
                '-c',
                './finder_rules/management/commands/google_checks.xml',
                dir_name
            ],
            stdout=subprocess.PIPE)

        out_str = check.stdout.read().decode("utf-8").replace(dir_name, '')

        return f'Check style:\n{out_str}'
