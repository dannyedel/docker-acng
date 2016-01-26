# My local apt-cacher-ng configuration

build with:

```
docker build -t dannyedel/acng --rm https://github.com/dannyedel/docker-acng.git
```

run with:

```
docker create -v /mnt/var_cache_apt_cacher_ng:/var/cache/apt_cacher_ng -p 3142:3142 dannyedel/acng
docker start acng
```
