# Домашнее задание "Введение в Terraform"

### Чеклист готовности к домашнему заданию
> Приложите скриншот вывода команды `terraform --version`

```shell
$ terraform --version
Terraform v1.4.6
on linux_amd64
```

### Задание 1.
> Изучите файл .gitignore. В каком terraform файле согласно этому .gitignore
> допустимо сохранить личную, секретную информацию?

`personal.auto.tfvars`

> Выполните код проекта. Найдите в State-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
```shell
"result": "xYIQUS6NFMx6LAxp"
```

> Объясните в чем заключаются намеренно допущенные ошибки (**доработано**)?:

* в файле main.tf при описании ресурса docker_image пропущено обязательное поле: имя
* при описании ресурса docker_container в поле "имя" используется цифра в начале `1nginx`, это ошибка
* в сабституторе: ` "example_${random_password.random_string_fake.resuld}"` опечатка, `resuld` нет такого, есть `result`
* там же - `random_string_fake` не существует, есть только `random_string`

> Выполните код. В качестве ответа приложите вывод команды `docker ps`:

```shell
16:46 $ docker ps                                                                                                                    
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES                   
16f6888b760f   f9c14fe76d50   "/docker-entrypoint.…"   5 seconds ago   Up 4 seconds   0.0.0.0:8000->80/tcp   example_rjmYLzGUvDb1Xz2G
```
> Замените имя docker-контейнера в блоке кода на hello_world,
> выполните команду terraform apply -auto-approve. Объясните своими словами,
> в чем может быть опасность применения ключа -auto-approve ?
> В качестве ответа дополнительно приложите вывод команды `docker ps`

```shell
17:42 $ docker ps                                                     
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
Oпасность видимо в том, что Terraform может удалить ресурсы, а при этом новые не создать.  
Поэтому, лучше смотреть план перед применением конфигурации.


> Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены.
> Приложите содержимое файла terraform.tfstate:

```tf
{                                                   
  "version": 4,                                     
  "terraform_version": "1.4.6",                     
  "serial": 34,                                     
  "lineage": "<hidden>",
  "outputs": {},                                    
  "resources": [],                                  
  "check_results": null                             
}                                                   
```

> Объясните, почему при этом не был удален docker образ nginx:latest?
> Ответ подкрепите выдержкой из документации провайдера.

Из-за опции [keep_locally](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image#keep_locally) не удалился докер имедж
