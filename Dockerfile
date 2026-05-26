# Build Stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build

WORKDIR /src
# Copy csproj files
COPY Catalog.API/Catalog.API.csproj Catalog.API/
COPY Catalog.API.Tests/Catalog.API.Tests.csproj Catalog.API.Tests/

# Restore
RUN dotnet restore Catalog.API/Catalog.API.csproj

COPY . .

RUN dotnet publish Catalog.API/Catalog.API.csproj \
    -c Release \
    -o /app/publish \
    /p:UseAppHost=false

# Runtime Stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0

WORKDIR /app
# Non-root user
RUN useradd -m appuser

# Copy app
COPY --from=build /app/publish .

# Permissions
RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8081

ENV ASPNETCORE_URLS=http://+:8081

ENTRYPOINT ["dotnet", "Catalog.API.dll"]