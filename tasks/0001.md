# devops-netology

Объясняем файл `terraform/.gitignore` _(далее относительно terraform директории в корне репозитория)_:  

---
* игнорировать содержимое .terraform директории и саму директорию, где бы она ни находилась  
например, содержимое: `.terraform/` или `a/.terraform/` или `a/b/.terraform/` будет проигнорировано гитом:  
`**/.terraform/*`  

* не обрабатывать файлы, имя которых заканчивается на `.tfstate`:  
`*.tfstate`  

* не обрабатывать файлы, имя которых содержит `.tfstate`:  
`*.tfstate.*` 

* не обрабатывать файл `crash.log`  
`crash.log`  

* не обрабатывать файлы начинающиеся с `crash` и заканчивающиеся с `.log` (например `crash.txt.log`):  
`crash.*.log`  

* не обрабатывать файлы, имя которых заканчивается на `.tfvars`:  
`*.tfvars`  

* не обрабатывать файлы, имя которых заканчивается на `.tfvars.json`:  
`*.tfvars.json`  

* не обрабатывать файлы `override.tf` и `override.tf.json`  
`override.tf`  
`override.tf.json`  

* не обрабатывать файлы, имя которых заканчивается на `_override.tf` и `_override.tf.json`  
`*_override.tf`  
`*_override.tf.json`  

* если один или несколько файлов не нужно игнорировать (в качестве исключения из  
предыдущего правила), то такой шаблон:  
`!example_override.tf`  

* не обрабатывать файлы `.terraformrc` и `terraform.rc`  
`.terraformrc`  
`terraform.rc`  

---
