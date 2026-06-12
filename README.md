# Catalog API

Product catalog microservice for the e-commerce platform.

## Features

* Product listing
* Categories
* Product details
* Prometheus metrics
* Health checks
* MySQL integration

## Tech Stack

* ASP.NET Core 10
* Entity Framework Core
* MySQL
* Docker

## Run with Docker

### Build Image

```bash
docker build -t catalog-api:v1 .
```

### Run Container

```bash
docker run -d \
--name catalog-api-dev \
-p 8081:8081 \
-e ASPNETCORE_URLS=http://+:8081 \
-e ConnectionStrings__MySQL="Server=host.docker.internal;Port=3306;Database=ecommerce;User=root;Password=rootpass123;" \
-e Jwt__Key="ThisIsA32CharOrLongerSuperSecretKey!2025" \
-e Jwt__Issuer="ecommerce-identity" \
-e Jwt__Audience="ecommerce" \
catalog-api:v1
```

## Endpoints

* `/api/catalog/products`
* `/api/catalog/categories`
* `/health`
* `/metrics`

## Port

* 8081
# test Fri Jun 12 09:16:47 PM EEST 2026
