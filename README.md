# Northwind

Test project

## Getting Started

The instructions below will give you a Northwind web api up and running on your development machine.

### Prerequisites

To run the Northwind project you will need:

- .Net Core ([v.3.1](https://dotnet.microsoft.com/download/dotnet-core/3.1))
- Docker

### Installing & Running

#### With Docker

To start SQL and Api use "docker-compose up".
To create Northwind database and fill with test data run "./build.ps1 -MigrateAndSeedWithTestData" in solution folder with PowerShell as admin.

### Troubleshooting
If you has error "...not digitally signed.." while running ./build.ps1 on local machine use this:
"Set-ExecutionPolicy Unrestricted LocalMachine"

