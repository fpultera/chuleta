# Chuletas Docker
Tratamos de optimizar una imagen RANDOM.

```
FROM centos
RUN yum update -y
RUN yum install -y wget
RUN yum install -y vim
RUN yum install -y ngin
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
```
