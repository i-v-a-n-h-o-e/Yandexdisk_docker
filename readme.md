## Docker with Yandex Disk client for ASUSTOR NAS

### How to use
1. Configure the paths of folders in Yandex Disk that do not need to be synchronized. To do this, list them comma separated in the CMD section of the Dockerfile.
For example 

```Dockerfile
CMD ["--no-daemon", "--dir=/root/Yandex.Disk", "--exclude-dirs=first_not_sync_folder,second_not_sync_folder"]
```

**There should be no spaces in the folder names!!!**

2. Build docker images via ```./build```.

3. Write the paths for the folder with configs and synchronized files in files `setup` and `run_daemon`

```sh
#Path to config and auth files of yandexdisk on host
PATH_TO_CONFIG="/volume1/Docker/YandexDisk/config"
#Path to sync folder of yandexdisk on host
PATH_TO_SYNC_FOLDER="/volume1/backup"
```

4. Run `setup` to auth and choose default settings.
```
./setup
Would you like to use a proxy server? [y/N]: 
Log in
If you don't have a Yandex account yet, get one at https://passport.yandex.com/passport?mode=register

Go to the page https://ya.ru/device and enter the code qwertyu within 300 seconds. Make sure you're logged in to the browser with the right account.Token saved to /root/.config/yandex-disk/passwd
Configure Yandex.Disk
Enter path to Yandex.Disk folder (Leave empty to use default folder '/root/Yandex.Disk'):
Would you like Yandex.Disk to launch on startup? [Y/n]:
Starting daemon process...Done
```

5. Run `run_daemon`
6. To get a status of yandex disk run
```sh
sudo docker exec yandex.disk yandex-disk status
```
 