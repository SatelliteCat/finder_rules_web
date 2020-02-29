# finder_rules_web
# Автоматизированная проверка работ


Установить Docker:

`sudo apt-get remove docker docker-engine docker.io containerd runc && sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88 && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io git`

(`debian` в двух ссылках можно заменить на `ubuntu`)

Ссылка: `https://docs.docker.com/install/`, если что-то пойдёт не так

Перейти в папку с проектами, там будет создана папка `finder_rules_web` после `git clone https://github.com/SatelliteCat/finder_rules_web.git && cd finder_rules_web`.

Развернуть контейнер: `sudo docker-compose up -d --build`

Развернуть dump базы данных:

`sudo docker exec -i finder_rules_web_database1_1 sh -c "exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"" < ./db/web_site.sql`

Сделать dump базы данных:

`sudo docker exec -i finder_rules_web_database1_1 sh -c "exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"" < ./db/web_site.sql`

