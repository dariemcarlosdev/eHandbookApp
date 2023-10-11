#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

#Create intermediate image from base image.
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

#Copy the code into working source directory, restore the nuget packages and builds the code and publishes code into publish directory
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["eHandBookApp.api/eHandBookApp.api.csproj", "eHandBookApp.api/"]
RUN dotnet restore "eHandBookApp.api/eHandBookApp.api.csproj"
COPY . .
WORKDIR "/src/eHandBookApp.api"
RUN dotnet build "eHandBookApp.api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "eHandBookApp.api.csproj" -c Release -o /app/publish /p:UseAppHost=false


#Copies the publish directory of step above into the final stage directory which creates the final production ready image
#which run once container is started running. 
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "eHandBookApp.api.dll"]