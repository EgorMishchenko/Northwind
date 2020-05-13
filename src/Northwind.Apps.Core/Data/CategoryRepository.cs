using System.Collections.Generic;
using Dapper;
using Microsoft.Data.SqlClient;
using Northwind.Core.Domain;

namespace Northwind.Core.Data
{
  public sealed class CategoryRepository : ICategoryRepository
  {
    private readonly string _connectionString;

    public CategoryRepository(string conn)
    {
      _connectionString = conn;
    }

    public IEnumerable<Category> GetCategories()
    {
      using (var db = new SqlConnection(_connectionString))
      {
        return db.Query<Category>("SELECT * FROM Categories");
      }
    }
  }
}
