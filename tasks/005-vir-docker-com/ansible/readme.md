# Deploy Monitoring Stack in Yandex Cloud

### Before begin add to inventory external ip from terraform
```shell
ansible_host=external_ip_from_tf_output
```

### Then apply your code
```shell
$ ansiible-playbook -i inventory provision.yml
```
