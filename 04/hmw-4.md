# Домашнее задание к занятию «Продвинутые методы работы с Terraform» -- Мельник С В

---

### Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания с помощью двух вызовов remote-модуля -> двух ВМ, относящихся к разным проектам(marketing и analytics) используйте labels для обозначения принадлежности. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
   Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
2. Добавьте в файл cloud-init.yml установку nginx.
3. Предоставьте скриншот подключения к консоли и вывод команды `sudo nginx -t`, скриншот консоли ВМ yandex cloud с их метками. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.marketing_vm

---

![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2011.44.50.png)
![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2011.45.07.png)
![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2011.46.17.png)
![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2011.48.08.png)
![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2011.49.10.png)

---

### Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: `ru-central1-a`.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev
4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Сгенерируйте документацию к модулю с помощью terraform-docs.

Пример вызова

```
module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  zone = "ru-central1-a"
  cidr = "10.0.1.0/24"
}
```

---

![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2011.50.20.png)

---

### Задание 3

1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Значимых(!!) изменений быть не должно.
   Приложите список выполненных команд и скриншоты процессы.

---

![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2011.59.52.png)
![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2012.08.12.png)
![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2012.10.44.png)
![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/screenshots/Снимок%20экрана%202025-07-13%20в%2012.21.10.png)
[terraform-docs](https://github.com/DeluxWebSite/ter-homeworks/blob/terraform-03/04/hmw-04/DOC.md 'Terraform-docs')
