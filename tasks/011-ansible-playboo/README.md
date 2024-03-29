# Домашнее задание "Работа с Ansible"

### Основная часть.

> 1. Подготовьте свой `inventory`-файл `prod.yml`.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/856115c)).

> 2. Допишите `playbook`: нужно сделать ещё один `play`, который устанавливает и настраивает [vector](https://vector.dev/).  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/376ff02)).

> 3. При создании `tasks` рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/0aee023)).

> 4. `Tasks` должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить [vector](https://vector.dev/).  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/0aee023)).

> 5. Запустите `ansible-lint` `site.yml` и исправьте ошибки, если они есть.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/0aee023)).

> 6. Попробуйте запустить playbook на этом окружении с флагом `--check`.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/0aee023)).

> 7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/0aee023)).

> 8. Повторно запустите `playbook` с флагом `--diff` и убедитесь, что `playbook` идемпотентен.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/0aee023)).

> 9. Подготовьте `README.md`-файл по своему `playbook`. В нём должно быть описано: что делает `playbook`, какие у него есть параметры и теги. Пример качественной документации `ansible playbook` по [ссылке](https://github.com/opensearch-project/ansible-playbook).  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/98e3b6c)).

> 10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.  
**Выполнено** (см. [коммит](https://github.com/ipodovalov/devops-netology/commit/98e3b6c)).

