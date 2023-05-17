# Create infrastructure in Yandex Cloud

### Before begin export variables
```shell
$ export TF_VAR_yc_cloud_id=your_cloud_id
$ export TF_VAR_yc_token=your_yc_token
$ export TF_VAR_yc_folder_id=your_folder_id
```

### Then apply your code
```shell
$ teffarorm init
$ terrafrom apply -auto-approve
```
