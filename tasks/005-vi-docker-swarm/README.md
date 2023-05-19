# Домашнее задание "Оркестрация кластером Docker контейнеров на примере Docker Swarm."

### Задача 1.
> В чём отличие режимов работы сервисов в Docker Swarm-кластере: replication и global?

* Режим репликации (replication) предполагает создание заданного количества реплик (инстансов) сервиса, которые запускаются на различных узлах кластера. Это позволяет обеспечить отказоустойчивость и масштабируемость. Реплики могут быть размещены на нескольких узлах, и Swarm-кластер автоматически обеспечивает балансировку нагрузки между ними.

* Режим глобального запуска (global) гарантирует, что на каждом узле кластера будет запущена по одной реплике сервиса. То есть каждый узел получит полную копию сервиса. Этот режим полезен, когда требуется, чтобы каждый узел в кластере выполнял определенную функцию или обеспечивал доступ к определенным ресурсам.

> Какой алгоритм выбора лидера используется в Docker Swarm-кластере?

* В Docker Swarm-кластере используется алгоритм выбора лидера, называемый "Рафт" (Raft). Алгоритм Рафт является одним из алгоритмов, который позволяет кластеру выбрать один узел в качестве лидера (leader), который будет координировать и управлять другими узлами. В случае отказа текущего лидера, кластер выбирает нового лидера автоматически.

> Что такое Overlay Network?

* Overlay Network (сеть с оверлеем) в Docker Swarm - это виртуальная сеть, которая обеспечивает связность и коммуникацию между сервисами и контейнерами, запущенными внутри Swarm-кластера. Она позволяет контейнерам, работающим на разных узлах кластера, обмениваться данными, как если бы они находились в одной сети. Overlay Network строится поверх существующей физической сетевой инфраструктуры и использует виртуальные сетевые адаптеры (Virtual Ethernet Bridges) для связи контейнеров между собой. Это обеспечивает изолированную среду для контейнеров и позволяет легко масштабировать приложения, добавлять и удалять узлы в кластере без необходимости изменения сетевой конфигурации ручным образом.k

### Задача 2.
> Создайте ваш первый Docker Swarm-кластер в Яндекс Облаке.
```shell
ubuntu@manager-01:~$ docker node ls 
ID                            HOSTNAME     STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
85wtryv0ln4l072gfkg3fo9gd *   manager-01   Ready     Active         Leader           24.0.0
0rblpyl8t8hlvdjufszeomqay     manager-02   Ready     Active         Reachable        24.0.0
2seaag3zow39rnfbsgzwivhs8     manager-03   Ready     Active         Reachable        24.0.0
oo72qca4qg6ydq09jjik0p5js     worker-01    Ready     Active                          24.0.0
zwhofdg4a0jj23c4fnjz5obw9     worker-02    Ready     Active                          24.0.0
g1lygocssc5wov47e4h6k2iop     worker-03    Ready     Active                          24.0.0
```

### Задача 3.
> Создайте ваш первый, готовый к боевой эксплуатации кластер мониторинга,
> состоящий из стека микросервисов.
```shell
ubuntu@manager-01:~$ docker service ls
ID             NAME                          MODE         REPLICAS   IMAGE                                          PORTS
swsx5b612163   monitoring_alertmanager       replicated   1/1        stefanprodan/swarmprom-alertmanager:v0.14.0    
rbj1v8yilzuf   monitoring_caddy              replicated   1/1        stefanprodan/caddy:latest                      *:3000->3000/tcp, *:9090->9090/tcp, *:9093-9094->9093-9094/tcp
368235jhl89i   monitoring_cadvisor           global       6/6        google/cadvisor:latest                         
5g68eslfnpox   monitoring_dockerd-exporter   global       6/6        stefanprodan/caddy:latest                      
v1y54iogn54n   monitoring_grafana            replicated   1/1        stefanprodan/swarmprom-grafana:5.3.4           
uqljsl7jkukz   monitoring_node-exporter      global       6/6        stefanprodan/swarmprom-node-exporter:v0.16.0   
y5rdz53i5vz0   monitoring_prometheus         replicated   1/1        stefanprodan/swarmprom-prometheus:v2.5.0       
4aoa08d6zr3g   monitoring_unsee              replicated   1/1        cloudflare/unsee:v0.8.0                        
```

### Задача 4.
> Выполните на лидере Docker Swarm-кластера команду и дайте eё письменное описание.

* При использовании команды `docker swarm update --autolock=true` устанавливается автоматическая блокировка ключевого хранилища. Это означает, что перед выполнением операций, требующих доступа к ключам шифрования, необходимо ввести пароль для разблокировки.
