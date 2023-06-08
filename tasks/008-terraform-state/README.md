# Домашнее задание "Управляющие конструкции в коде Terraform"

### Задание 1.

> Приложите скриншот входящих правил "Группы безопасности" в ЛК Yandex Cloud  
![screenshot](./1.png)  

### Задание 2.

> 1. Создайте файл count-vm.tf. Опишите в нем создание двух одинаковых ВМ web-1 и web-2(не web-0 и web-1!), с минимальными параметрами, используя мета-аргумент `count loop`. Назначьте ВМ созданную в 1-м задании группу безопасности.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/d2eded7b463603cf24cd28780ccaf36d6a06d286)).

> 2. Создайте файл `for_each-vm.tf`. Опишите в нем создание 2 ВМ с именами "main" и "replica" разных по cpu/ram/disk , используя мета-аргумент `for_each loop`. Используйте переменную типа `list(object({ vm_name=string, cpu=number, ram=number, disk=number }))`. При желании внесите в переменную все возможные параметры.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/)).

> 3. ВМ из пункта 2.2 должны создаваться после создания ВМ из пункта 2.1.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/)).

> 4. Используйте функцию file в local переменной для считывания ключа `~/.ssh/id_rsa.pub` и его последующего использования в блоке metadata, взятому из ДЗ №2.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/)).

> 5. Инициализируйте проект, выполните код.
**Выполнено**

### Задание 3.

> 1. Создайте 3 одинаковых виртуальных диска, размером 1 Гб с помощью ресурса `yandex_compute_disk` и мета-аргумента `count` в файле `disk_vm.tf`.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/)).

> 2. Создайте в том же файле одну ВМ c именем "storage". Используйте блок dynamic `secondary_disk{..}` и мета-аргумент `for_each` для подключения созданных вами дополнительных дисков.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/)).

### Задание 4.

> 1. В файле `ansible.tf` создайте `inventory-файл` для `ansible`. Используйте функцию `tepmplatefile` и файл-шаблон для создания `ansible` inventory-файла из лекции. Готовый код возьмите из демонстрации к лекции [demonstration2](https://github.com/netology-code/ter-homeworks/tree/main/demonstration2). Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2.(т.е. 5 ВМ).  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/)).

> 2. Инвентарь должен содержать 3 группы `[webservers]`, `[databases]`, `[storage]` и быть динамическим, т.е. обработать как группу из 2-х ВМ так и 999 ВМ.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/)).

> 3. Выполните код. Приложите скриншот получившегося файла.  
![screenshot](./2.png)  

