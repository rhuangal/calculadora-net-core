FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY calculadora-net-core.csproj calculadora-net-core/
RUN dotnet restore calculadora-net-core/calculadora-net-core.csproj
WORKDIR /src/calculadora-net-core
COPY . .
RUN dotnet build calculadora-net-core.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish calculadora-net-core.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "calculadora-net-core.dll"]