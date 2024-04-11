# diplomatura-devops
Docker compose 
- Docker in docker
- Jenkins con cli docker y blue ocean
## Roxx
 - https://gitlab.com/training-cloud/mundose-2305
 In this repository, you have a docker files with jenkins and some stuff (File Dockerfile_Rox_tools)

If you want a nginx proxy follow:
- https://github.com/nginx-proxy/nginx-proxy
- For SSL
 https://github.com/nginx-proxy/acme-companion
- DNS mockup
 * https://nip.io/
 * https://sslip.io/

 ## Repositorie for practices
 https://gitlab.com/roxsross-public/retail-store-app-cicd
 https://github.com/dockersamples


##Bash scrip
#!/bin/bash
directories=$(ls)
for directory in $directories
    do
    if [ -d "$(pwd)/$directory" ] 
    then
            echo "Compilo la imagen del docker"
    fi
    echo "no es directorio $(pwd)/$directory"
    done