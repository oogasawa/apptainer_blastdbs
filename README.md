# apptainer_blastdbs

An apptainer container image for `ncbi-blast-dbs` script of SequenceServer.
https://sequenceserver.com/doc/

Since `ncbi-blast-dbs` tries to download as many CPU cores as there are cores simultaneously, 
this apptainer container controls the visible CPU cores for `ncbi-blast-dbs` using apptainer functions.


## How to build

1, First, build a docker container image.

```
git clone https://github.com/oogasawa/apptainer_blastdbs
cd apptainer_blastdbs
docker build -t apptainer_blastdbs:latest .
```

2, Create a tar file of the docker container image on your local hard disk.

``` sh
docker save -o apptainer_blastdbs.docker.tar apptainer_blastdbs:latest
```

3, Build a apptainer image file (`*.sif` file) from the docker image file.

``` sh
sudo apptainer build apptainer_blastdbs.sif docker-archive://apptainer_blastdbs.docker.tar
```



## Usage

The following command downloads the database in parallel with four instances.

``` sh
apptainer exec --cpus 4  apptainer_blastdbs.sif ncbi-blastdbs nt
```

Caution: If cgroups v2 is not enabled on your OS, the `--cpus` option will not work. You will get the following error.

``` sh
INFO:    underlay of /etc/localtime required more than 50 (92) bind mounts
FATAL:   container creation failed: while applying cgroups config: while setting cgroup limits: openat2 /sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/user.slice/apptainer-2017830.scope/cpu.max: no such file or directory
```
