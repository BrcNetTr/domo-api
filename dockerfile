FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

WORKDIR /app

COPY . .

RUN dotnet publish -c Release --property:PublishDir=/out


# Runtime Image

FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR /app

COPY --from=build-env /out .

ENTRYPOINT dotnet domo-api.dll