# Use the official .NET runtime image as a base
FROM mcr.microsoft.com/dotnet/aspnet:9.0-alpine AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Use the official .NET SDK image for building the application
FROM mcr.microsoft.com/dotnet/sdk:9.0-alpine AS build
WORKDIR /src
COPY ["McpServer.csproj", "./"]
RUN dotnet restore "./McpServer.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet publish "McpServer.csproj" -c Release -o /app/publish

# Final stage: Build the runtime image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "app.dll"]

# Ensure compatibility with WSL by setting the correct line endings
RUN dos2unix /app/*
