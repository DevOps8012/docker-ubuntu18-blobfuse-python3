# docker-ubuntu18-blobfuse-python3

Docker image which adds Python 3 to the
[jeffreybreen/docker-ubuntu18-blobfuse](https://hub.docker.com/r/jeffreybreen/ubuntu18-blobfuse/)
image (Ubuntu 18.04 + Microsoft's FUSE driver for Azure blob containers).

|-------------|-------------------------------------------------------------------------------------------------------------------|
| Docker Hub: | [jeffreybreen/ubuntu18-blobfuse-python3](https://hub.docker.com/r/jeffreybreen/ubuntu18-blobfuse-python3/)        |
| github:     | [jeffreybreen/docker-ubuntu18-blobfuse-python3](https://github.com/jeffreybreen/docker-ubuntu18-blobfuse-python3) |

See the [README for the base image](https://github.com/jeffreybreen/docker-ubuntu18-blobfuse/blob/master/README.md) 
for more details on configuring the environment variables, etc. for blobfuse.

[This informative article by Vladislav
Supalov](https://vsupalov.com/docker-arg-env-variable-guide/) is a great
resource for more information about passing environment variables to
Docker containers, including with Docker Compose.

## `make shell` and `make test` targets

In addition to the `make shell` target which mounts the blob container
(via the `mount-blobfuse.sh` entrypoint) and enters bash, this image's
Makefile adds a simple `make test` target which executes the included
`printenv.py` Python script to display all environment variables
available at run time:

```
$ make test
docker run --rm --name ubuntu18-blobfuse-python3-default -i -t  \
  -e AZURE_STORAGE_ACCOUNT -e AZURE_STORAGE_SAS_TOKEN \
  -e AZURE_STORAGE_ACCOUNT_CONTAINER -e AZURE_MOUNT_POINT \
  --cap-add=MKNOD --cap-add=SYS_ADMIN --device=/dev/fuse \
  jeffreybreen/ubuntu18-blobfuse-python3:0.1 printenv.py
AZURE_MOUNT_POINT: [REDACTED] 
AZURE_STORAGE_ACCOUNT: [REDACTED] 
AZURE_STORAGE_ACCOUNT_CONTAINER: [REDACTED] 
AZURE_STORAGE_SAS_TOKEN: [REDACTED] 
HOME: /root 
HOSTNAME: 719d123ac5f2 
LANG: en_US.utf8 
PATH: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin 
PWD: / 
SHLVL: 0 
TERM: xterm 
```

Note that the values of any environment variables whose names begin with
"AWS\_" or "AZURE\_" are redacted.
