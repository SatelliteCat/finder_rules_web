import os
import os.path
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
        # print(args[1])  # path (v1-dir_name; v2-git_link)
        # args[2]            test id

        # cur_dir = os.path.dirname(
        #     'C:\\Users\\user\\Documents\\projects\\finder_rules\\finder_rules_web\\projects\\' + args[1]
        # )
        # cur_dir = 'C:\\Users\\user\\Documents\\projects\\finder_rules\\finder_rules_web\\projects\\' + args[1] + '\\'
        # cur_dir = os.path.dirname(os.getcwd() + '/projects/' + args[1] + '/')
        cur_dir = os.path.dirname(os.getcwd() + '/projects/')
        # print(cur_dir)

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

            # global is_rule
            # is_rule = False

            try:
                # group_id = Group.objects.get(name__iexact=args[0]).id
                # rules = Rule.objects.filter(group_id__exact=group_id)
                rules = Rule.objects.filter(group_id__exact=int(args[0]))

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

            finally:
                res_file.write(text)
                test = Test.objects.filter(id__exact=int(args[2]))
                test.update(result=text)
