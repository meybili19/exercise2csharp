# Use an official .NET SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Copy project files and restore dependencies
COPY *.csproj .
RUN dotnet restore

# Copy all files and build the application
COPY . .
RUN dotnet publish -c Release -o /out

# Use a runtime image to run the application
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /out .

# Expose port 80 for the application
EXPOSE 80

# Command to run the application
ENTRYPOINT ["dotnet", "exercise2csharp.dll"]