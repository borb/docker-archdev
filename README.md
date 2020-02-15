# archdev

## A Docker image for C/C++ development (based on archlinux)

Build because of issues regarding testing and developing tools which use `select` and `poll` under WSL 1 (likely resolved in WSL 2).

## Notes

Includes an sshd; `docker-exec` into the container as `devuser` and write an authorised ssh key in order to log into the environment. The user account is not assigned a password and set to have a password which is not valid for login; please use key-based authentication only.

### `/home/devuser` volume

`/home/devuser` is automatically assigned a Docker persistent volume unless one is mapped with `-v` or `docker-compose.yml`. ssh keys written into here will persist.
