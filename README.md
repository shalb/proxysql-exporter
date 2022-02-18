# Info

proxysql-exporter container for PXC proxysql monitoring

# Build

```
docker login
docker-compose -f docker-compose-build.yaml build
docker-compose -f docker-compose-build.yaml push
```

# Test

```
docker-compose -f docker-compose-build.yaml build; docker-compose down ; docker-compose up -d ; docker-compose exec proxysql-exporter wget -O - 127.0.0.1:42004/metrics | grep proxysql_up
```

# Run

```
docker-compose up -d && docker-compose exec work bash
```
