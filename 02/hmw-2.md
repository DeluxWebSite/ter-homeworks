# Домашнее задание к занятию «Основы Terraform. Yandex Cloud» -- Мельник С.В.

### Задание 1

В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.
Убедитесь что ваша версия **Terraform** ~>1.8.4

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Создайте сервисный аккаунт и ключ. [service_account_key_file](https://terraform-provider.yandexcloud.net).
3. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную **vms_ssh_public_root_key**.
4. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
5. Подключитесь к консоли ВМ через ssh и выполните команду ` curl ifconfig.me`.
   Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: `"ssh ubuntu@vm_ip_address"`. Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: `eval $(ssh-agent) && ssh-add` Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;
6. Ответьте, как в процессе обучения могут пригодиться параметры `preemptible = true` и `core_fraction=5` в параметрах ВМ.

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;
- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;
- ответы на вопросы.

---

## Ответы

1. Изучил проект
2. Создал сервисный аккаунт
3. Сгенерировал ssh ключ
4. исправил ошибки и инициализировал проект
   Ошибки были следующие:

- В строке platform_id = "standart-v4" должно быть слово standard
- Версия v4 неправильная. Согласно документации Yandex.Cloud (https://cloud.yandex.ru/docs/compute/concepts/vm-platforms) платформы могут быть только v1, v2 и v3.
- В строке cores = 1 указано неправильное количество ядер процессора. Согласно документации Yandex.Cloud (https://cloud.yandex.ru/docs/compute/concepts/performance-levels) минимальное количество виртуальных ядер процессора для всех платформ равно двум.

После исправления ошибок удалось запустить код и создать виртуальную машину.

1. ![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/main/02/screenshots/Снимок%20экрана%202025-07-05%20в%2016.33.41.png)
   ![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/main/02/screenshots/Снимок%20экрана%202025-07-05%20в%2016.34.04.png)
   ![alt text](https://github.com/DeluxWebSite/ter-homeworks/blob/main/02/screenshots/Снимок%20экрана%202025-07-05%20в%2016.34.30.png)

2. Параметр preemptible = true применяется в том случае, если нужно сделать виртуальную машину прерываемой, то есть возможность остановки ВМ в любой момент. Применятся если с момента запуска машины прошло 24 часа либо возникает нехватка ресурсов для запуска ВМ. Прерываемые ВМ не обеспечивают отказоустойчивость. Параметр core_fraction=5 указывает базовую производительность ядра в процентах. Указывается для экономии ресурсов.

---

### Задание 2

1. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm*web*** . Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf.
3. Проверьте terraform plan. Изменений быть не должно.

---

![terraform plan](https://github.com/DeluxWebSite/ter-homeworks/blob/main/02/screenshots/tf%20plan%202025-07-05%20в%2017.14.42.png)
![terraform plan](https://github.com/DeluxWebSite/ter-homeworks/blob/main/02/screenshots/tf%20plan%202%202025-07-05%20в%2017.16.49.png)

---

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** , `cores  = 2, memory = 2, core_fraction = 20`. Объявите её переменные с префиксом **vm*db*** в том же файле ('vms_platform.tf'). ВМ должна работать в зоне "ru-central1-b"
3. Примените изменения.

---

![+ vm db](https://github.com/DeluxWebSite/ter-homeworks/blob/main/02/screenshots/3-1%20Снимок%20экрана%202025-07-05%20в%2017.37.48.png)

---

### Задание 4

1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
2. Примените изменения.

## В качестве решения приложите вывод значений ip-адресов команды `terraform output`.

![outputs](https://github.com/DeluxWebSite/ter-homeworks/blob/main/02/screenshots/4-1%20Снимок%20экрана%202025-07-05%20в%2017.43.49.png)
![outputs](https://github.com/DeluxWebSite/ter-homeworks/blob/main/02/screenshots/4-2%20Снимок%20экрана%202025-07-05%20в%2017.43.39.png)

---

Задание 5

В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
Примените изменения.

---

### Задание 6

1. Вместо использования трёх переменных "..\_cores","..\_memory","..\_core_fraction" в блоке resources {...}, объедините их в единую map-переменную **vms_resources** и внутри неё конфиги обеих ВМ в виде вложенного map(object).
   ```
   пример из terraform.tfvars:
   vms_resources = {
     web={
       cores=2
       memory=2
       core_fraction=5
       hdd_size=10
       hdd_type="network-hdd"
       ...
     },
     db= {
       cores=2
       memory=4
       core_fraction=20
       hdd_size=10
       hdd_type="network-ssd"
       ...
     }
   }
   ```
2. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.

   ```
   пример из terraform.tfvars:
   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }
   ```

3. Найдите и закоментируйте все, более не используемые переменные проекта.
4. Проверьте terraform plan. Изменений быть не должно.

[def]: https://github.com/DeluxWebSite/ter-homeworks/blob/main/02/screenshots/Снимок%20экрана%202025-07-05%20в%2016.33.41.png
