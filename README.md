# Chuletas Docker
Tratamos de optimizar una imagen RANDOM.
Dockerfile original
```bash
FROM centos
RUN yum update -y
RUN yum install -y wget
RUN yum install -y vim
RUN yum install -y nginx
```

Los tres run que figuran no estan mal, pero van a generar en el build de la imagen tres capas diferentes con mucho peso,
para esto podemos concatenar lo orden "install" con doble &

## docker build para test

```
docker build -t test .
```

## chequeamos el peso

```
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
test                latest              ff5977273472        3 seconds ago       385MB
centos              latest              0d120b6ccaa8        11 days ago         215MB

```
## Dockerfile anidado
```bash
FROM centos
RUN yum update -y
RUN yum install -y wget vim nginx
```

## docker build para test
```
docker build-anidado -t test .
```
## chequeamos el peso
```
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
test-anidado        latest              97e85cdf97b9        3 seconds ago       341MB
test                latest              ff5977273472        2 minutes ago       385MB
centos              latest              0d120b6ccaa8        11 days ago         215MB
```
Ahorro de 40MB entre la imagen test y la imagen test-anidado

## Dockerfile anidado
```bash
FROM centos
RUN yum update -y
RUN yum install -y wget vim nginx && yum clean all
```
## docker build para test
```
docker build-anidado -t test .
```
## chequeamos el peso
```
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
test-clean          latest              594a1442fcb5        4 seconds ago       333MB
test-anidado        latest              97e85cdf97b9        7 minutes ago       341MB
test                latest              ff5977273472        10 minutes ago      385MB
centos              latest              0d120b6ccaa8        11 days ago         215MB
```
Ahorro de 12MB entre la imagen test-anidado y la imagen test-clean
