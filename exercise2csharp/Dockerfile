FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["exercise2csharp/exercise2csharp.csproj", "exercise2csharp/"]
RUN dotnet restore "exercise2csharp/exercise2csharp.csproj"
COPY . .
WORKDIR "/src/exercise2csharp"
RUN dotnet build "exercise2csharp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "exercise2csharp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "exercise2csharp.dll"]
