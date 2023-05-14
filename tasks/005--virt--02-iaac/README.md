# Домашнее задание к занятию 2. «Применение принципов IaaC в работе с виртуальными машинами»

### Задача 1.
> Опишите основные преимущества применения на практике IaaC-паттернов.
* Ускорение производства и вывода продукта на рынок.
* Стабильность среды, устранение дрейфа конфигураций.
* Более быстрая и эффективная разработка.
* Идемпотентность (свойство объекта или операции, при повторном выполнении которой мы получаем результат идентичный
предыдущему и всем последующим выполнениям).

> Какой из принципов IaaC является основополагающим?
* Автоматизация управления инфраструктурой через ее программное представление в виде кода.

### Задача 2.
> Чем Ansible выгодно отличается от других систем управление конфигурациями?
* Ansible очень прост в использовании и настройке, так как не требует установки агентов на управляемые узлы.
* Использует Push метод для применения конфигураций, то есть управляющий узел отправляет команды на управляемые узлы через ssh.
* Ansible использует формат YAML для описания конфигурации. Проще для восприятия.
* По-моему, является мейнстримом последнее время, то есть наиболее популярен и проще найти спецов.
* Написан на Python, то есть опять же "популярность" и "порог входа"

> Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull? 
* На мой взгляд, тот который проще и удобнее, тот и лучше.
  Push метод не требует установки агентов на целевые хосты, а значит меньше распределённых сущностей,
  которые могут выйти из строя. Видимо Push надёжнее.

### Задача 3.
> Установите на личный компьютер:
* VirtualBox  
  ```shell
  $ virtualbox --help
  Oracle VM VirtualBox VM Selector v7.0.6
  Copyright (C) 2005-2023 Oracle and/or its affiliates
  ```
* Vagrant
  ```shell
  $ vagrant --version
  Vagrant 2.3.4
  ```
* Terraform
  ```shell
  $ terraform --version
  Terraform v1.4.6
  on linux_amd64
  ```
* Ansible
  ```shell
  09:08 $ ansible --version
  ansible 2.9.6
  ```
  
### Задача 4.
* Практика с Vagrant:
  ```bash
  ✔ ~/netology/devops-netology/tasks/005--virt--02-iaac/vagrant [main L|✚ 1…1] 
  11:27 $ vagrant up
  Bringing machine 'ivan-server1.netology' up with 'virtualbox' provider...
  ==> ivan-server1.netology: Importing base box 'bento/ubuntu-20.04'...
  ==> ivan-server1.netology: Matching MAC address for NAT networking...
  ==> ivan-server1.netology: Setting the name of the VM: ivan-server1.netology
  ==> ivan-server1.netology: Clearing any previously set network interfaces...
  ==> ivan-server1.netology: Preparing network interfaces based on configuration...
      ivan-server1.netology: Adapter 1: nat
      ivan-server1.netology: Adapter 2: hostonly
  ==> ivan-server1.netology: Forwarding ports...
      ivan-server1.netology: 22 (guest) => 20011 (host) (adapter 1)
      ivan-server1.netology: 22 (guest) => 2222 (host) (adapter 1)
  ==> ivan-server1.netology: Running 'pre-boot' VM customizations...
  ==> ivan-server1.netology: Booting VM...
  ==> ivan-server1.netology: Waiting for machine to boot. This may take a few minutes...
      ivan-server1.netology: SSH address: 127.0.0.1:2222
      ivan-server1.netology: SSH username: vagrant
      ivan-server1.netology: SSH auth method: private key
      ivan-server1.netology: 
      ivan-server1.netology: Vagrant insecure key detected. Vagrant will automatically replace
      ivan-server1.netology: this with a newly generated keypair for better security.
      ivan-server1.netology: 
      ivan-server1.netology: Inserting generated public key within guest...
      ivan-server1.netology: Removing insecure key from the guest if it's present...
      ivan-server1.netology: Key inserted! Disconnecting and reconnecting using new SSH key...
  ==> ivan-server1.netology: Machine booted and ready!
  ==> ivan-server1.netology: Checking for guest additions in VM...
  ==> ivan-server1.netology: Setting hostname...
  ==> ivan-server1.netology: Configuring and enabling network interfaces...
  ==> ivan-server1.netology: Mounting shared folders...
      ivan-server1.netology: /vagrant => /home/ipodovalov/netology/devops-netology/tasks/005--virt--02-iaac/vagrant
  ✔ ~/netology/devops-netology/tasks/005--virt--02-iaac/vagrant [main L|✚ 1…1] 
  11:29 $ vagrant ssh
  Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-144-generic x86_64)
  
   * Documentation:  https://help.ubuntu.com
   * Management:     https://landscape.canonical.com
   * Support:        https://ubuntu.com/advantage
  
    System information as of Sun 14 May 2023 08:29:42 AM UTC
  
    System load:  0.76               Processes:             150
    Usage of /:   11.5% of 30.34GB   Users logged in:       0
    Memory usage: 23%                IPv4 address for eth0: 10.0.2.15
    Swap usage:   0%                 IPv4 address for eth1: 192.168.56.11
  
  
  This system is built by the Bento project by Chef Software
  More information can be found at https://github.com/chef/bento
  vagrant@ivan-server1:~$ hostname -f
  ivan-server1.netology
  vagrant@ivan-server1:~$ cat /etc/os-release 
  NAME="Ubuntu"
  VERSION="20.04.6 LTS (Focal Fossa)"
  ID=ubuntu
  ID_LIKE=debian
  PRETTY_NAME="Ubuntu 20.04.6 LTS"
  VERSION_ID="20.04"
  HOME_URL="https://www.ubuntu.com/"
  SUPPORT_URL="https://help.ubuntu.com/"
  BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
  PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
  VERSION_CODENAME=focal
  UBUNTU_CODENAME=focal
  vagrant@ivan-server1:~$ exit
  logout
  Connection to 127.0.0.1 closed.
  ✔ ~/netology/devops-netology/tasks/005--virt--02-iaac/vagrant [main L|✚ 1…1] 
  11:30 $ vagrant halt 
  ==> ivan-server1.netology: Attempting graceful shutdown of VM...
  ✔ ~/netology/devops-netology/tasks/005--virt--02-iaac/vagrant [main L|✚ 1…1] 
  11:30 $ vagrant destroy 
      ivan-server1.netology: Are you sure you want to destroy the 'ivan-server1.netology' VM? [y/N] y
  ```
* Практика с Ansible:
  ```bash
  ✔ ~/netology/devops-netology/tasks/005--virt--02-iaac/vagrant [main L|✚ 1…1] 
  13:44 $ vagrant up
  Bringing machine 'ivan-server1.netology' up with 'virtualbox' provider...
  ==> ivan-server1.netology: Importing base box 'bento/ubuntu-20.04'...
  ==> ivan-server1.netology: Matching MAC address for NAT networking...
  ==> ivan-server1.netology: Setting the name of the VM: ivan-server1.netology
  ==> ivan-server1.netology: Clearing any previously set network interfaces...
  ==> ivan-server1.netology: Preparing network interfaces based on configuration...
      ivan-server1.netology: Adapter 1: nat
      ivan-server1.netology: Adapter 2: hostonly
  ==> ivan-server1.netology: Forwarding ports...
      ivan-server1.netology: 22 (guest) => 20011 (host) (adapter 1)
      ivan-server1.netology: 22 (guest) => 2222 (host) (adapter 1)
  ==> ivan-server1.netology: Running 'pre-boot' VM customizations...
  ==> ivan-server1.netology: Booting VM...
  ==> ivan-server1.netology: Waiting for machine to boot. This may take a few minutes...
      ivan-server1.netology: SSH address: 127.0.0.1:2222
      ivan-server1.netology: SSH username: vagrant
      ivan-server1.netology: SSH auth method: private key
      ivan-server1.netology: Warning: Connection reset. Retrying...
      ivan-server1.netology: Warning: Remote connection disconnect. Retrying...
      ivan-server1.netology: 
      ivan-server1.netology: Vagrant insecure key detected. Vagrant will automatically replace
      ivan-server1.netology: this with a newly generated keypair for better security.
      ivan-server1.netology: 
      ivan-server1.netology: Inserting generated public key within guest...
      ivan-server1.netology: Removing insecure key from the guest if it's present...
      ivan-server1.netology: Key inserted! Disconnecting and reconnecting using new SSH key...
  ==> ivan-server1.netology: Machine booted and ready!
  ==> ivan-server1.netology: Checking for guest additions in VM...
  ==> ivan-server1.netology: Setting hostname...
  ==> ivan-server1.netology: Configuring and enabling network interfaces...
  ==> ivan-server1.netology: Mounting shared folders...
      ivan-server1.netology: /vagrant => /home/ipodovalov/netology/devops-netology/tasks/005--virt--02-iaac/vagrant
  ==> ivan-server1.netology: Running provisioner: ansible...
      ivan-server1.netology: Running ansible-playbook...
  
  PLAY [Playbook] ****************************************************************
  
  TASK [Gathering Facts] *********************************************************
  ok: [ivan-server1.netology]
  
  TASK [Create directory for ssh-keys] *******************************************
  ok: [ivan-server1.netology]
  
  TASK [Adding rsa-key in /root/.ssh/] *******************************************
  changed: [ivan-server1.netology]
  
  TASK [Checking DNS] ************************************************************
  changed: [ivan-server1.netology]
  
  TASK [Installing tools] ********************************************************
  ok: [ivan-server1.netology]
  
  TASK [Installing docker] *******************************************************
  changed: [ivan-server1.netology]
  
  TASK [Add the current user to docker group] ************************************
  changed: [ivan-server1.netology]
  
  PLAY RECAP *********************************************************************
  ivan-server1.netology      : ok=7    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
  
  ✔ ~/netology/devops-netology/tasks/005--virt--02-iaac/vagrant [main L|✚ 1…1] 
  13:50 $ vagrant ssh
  Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-144-generic x86_64)
  
   * Documentation:  https://help.ubuntu.com
   * Management:     https://landscape.canonical.com
   * Support:        https://ubuntu.com/advantage
  
    System information as of Sun 14 May 2023 10:50:46 AM UTC
  
    System load:  0.86               Users logged in:          0
    Usage of /:   13.4% of 30.34GB   IPv4 address for docker0: 172.17.0.1
    Memory usage: 26%                IPv4 address for eth0:    10.0.2.15
    Swap usage:   0%                 IPv4 address for eth1:    192.168.56.11
    Processes:    139
  
   * Introducing Expanded Security Maintenance for Applications.
     Receive updates to over 25,000 software packages with your
     Ubuntu Pro subscription. Free for personal use.
  
       https://ubuntu.com/pro
  
  
  This system is built by the Bento project by Chef Software
  More information can be found at https://github.com/chef/bento
  Last login: Sun May 14 10:50:36 2023 from 10.0.2.2
  vagrant@ivan-server1:~$ docker --version
  Docker version 23.0.6, build ef23cbc
  vagrant@ivan-server1:~$ docker ps
  CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
  ```
