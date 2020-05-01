#addin "nuget:?package=Cake.Docker&version=0.10.1"
#addin "nuget:?package=dbup-sqlserver&version=4.2.0"
#addin "nuget:?package=dbup-core&version=4.2.0"

string target = Argument("target", "Release");
target = target == "Default" ? "Release" : target;

Task("Release")
  .Does(() =>
{
  Information("Hello from release!");
});

Task("MigrateAndSeedWithTestData")
  .IsDependentOn("Migrate")
  .Does(() =>
{
    var host = Argument("host", "localhost");
    var port = Argument("port", "1551");
    var user = Argument("user", "sa");
    var password = Argument("password", "Popup45965");

    string connStr = string.Format("Data Source={0},{1};Initial Catalog=Northwind;Integrated Security=False;User Id={2};Password={3};MultipleActiveResultSets=True", host, port, user, password);
    DbUp.EnsureDatabase.For.SqlDatabase(connStr);

    var upgrader = DbUp.DeployChanges.To
        .SqlDatabase(connStr)
        .WithScriptsFromFileSystem(MakeAbsolute(Directory("./sql/seed")).FullPath)
        .LogToConsole()
        .WithExecutionTimeout(TimeSpan.FromSeconds(180))
        .Build();

    var result = upgrader.PerformUpgrade();
});

Task("Migrate")
  .Does(() => {
    var host = Argument("host", "localhost");
    var port = Argument("port", "1551");
    var user = Argument("user", "sa");
    var password = Argument("password", "Popup45965");

    string connStrMaster =
      string.Format("Data Source={0},{1};Initial Catalog=master;Integrated Security=False;User Id={2};Password={3};MultipleActiveResultSets=True", host, port, user, password);
    
    while (true)
    {
      try
      {
        var sql = new System.Data.SqlClient.SqlConnection(connStrMaster);
        sql.Open();
        var cmd = sql.CreateCommand();
        cmd.CommandText = "SELECT 1;";
        cmd.ExecuteNonQuery();
        sql.Dispose();
        break;
      }
      catch (System.Data.SqlClient.SqlException)
      {
        System.Threading.Thread.Sleep(100);
      }
    }

    string connStr = string.Format("Data Source={0},{1};Initial Catalog=Northwind;Integrated Security=False;User Id={2};Password={3};MultipleActiveResultSets=True", host, port, user, password);
    DbUp.EnsureDatabase.For.SqlDatabase(connStr);
      var upgrader = DbUp.DeployChanges.To
        .SqlDatabase(connStr)
        .WithScriptsFromFileSystem(MakeAbsolute(Directory("./sql/do")).FullPath)
        .LogToConsole()
        .WithExecutionTimeout(TimeSpan.FromSeconds(180))
        .Build();

      var result = upgrader.PerformUpgrade();
    });

RunTarget(target);