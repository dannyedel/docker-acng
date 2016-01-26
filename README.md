# My local apt-cacher-ng configuration

build with:

```
docker build -t dannyedel/acng --rm https://github.com/dannyedel/docker-acng.git
```

run with:

```
docker create --restart=always -m 256M -v /mnt/var_cache_apt_cacher_ng/:/var/cache/apt-cacher-ng:rw -p 3142:3142 --name acng dannyedel/acng
docker start acng
```
