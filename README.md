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



DB First:
Scaffold-DbContext "Server=127.0.0.1,1551;Database=Northwind;Trusted_Connection=False;MultipleActiveResultSets=True;User ID=sa;Password=Popup45965" Microsoft.EntityFrameworkCore.SqlServer