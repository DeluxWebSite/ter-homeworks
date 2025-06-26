# Домашнее задание к занятию «Введение в Terraform» -- Мельник С В.

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте.
2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)
3. Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.
4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.
   Выполните команду `terraform validate`. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды `docker ps`.
6. Замените имя docker-контейнера в блоке кода на `hello_world`. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду `terraform apply -auto-approve`.
   Объясните своими словами, в чём может быть опасность применения ключа `-auto-approve`. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды `docker ps`.
7. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**.
8. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ**, а затем **ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ** строчкой из документации [**terraform провайдера docker**](https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs). (ищите в классификаторе resource docker_image )

---

Ответ

- допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд) -- personal.auto.tfvars
- намеренно допущенные ошибки в правильном написании и оформлении кода
- не был удалён docker-образ nginx:latest и-за опции keep_locally = true, Значение true означает, что образ Docker не будет удалён при операции уничтожения (destroy). Если параметр установлен в значение false, то образ будет удалён из локального хранилища Docker при той же операции.

![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/main/01/screenshots/terraform-version.png)

![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/main/01/screenshots/tfstate.png)

![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/main/01/screenshots/dockerpsnginx.png)

![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/main/01/screenshots/dockerpshelloworld.png)

![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/main/01/screenshots/debugmaintf.png)

![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/main/01/screenshots/terdestroy.png)
