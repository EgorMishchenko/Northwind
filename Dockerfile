FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-bionic AS base
WORKDIR /base

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-bionic AS app
WORKDIR /app

COPY ["src/NorthwindSite.Api/NorthwindSite.Api.csproj", "src/NorthwindSite.Api/"]
COPY ["src/NorthwindSite.Core/NorthwindSite.Core.csproj", "src/NorthwindSite.Core/"]

RUN dotnet restore "src/NorthwindSite.Api/NorthwindSite.Api.csproj"

COPY . .
WORKDIR "/app/src/NorthwindSite.Api"
RUN dotnet build "NorthwindSite.Api.csproj" -c Release -o /base/build

FROM app AS publish
RUN dotnet publish "NorthwindSite.Api.csproj" -c Release -o /base/publish
 
FROM base AS final
WORKDIR /base
COPY --from=publish /base/publish .
ENTRYPOINT ["dotnet", "NorthwindSite.Api.dll"]