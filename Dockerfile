# Usa una imagen oficial de .NET SDK para construir la aplicación
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Copia los archivos de proyecto y restaura las dependencias
COPY *.csproj .
RUN dotnet restore

# Copia todos los archivos y construye la aplicación
COPY . .
RUN dotnet publish -c Release -o /out

# Usa una imagen de runtime para ejecutar la aplicación
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /out .

# Expone el puerto 80 para la aplicación
EXPOSE 80

# Comando para ejecutar la aplicación
ENTRYPOINT ["dotnet", "exercise2csharp.dll"]