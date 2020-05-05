using System.Collections.Generic;
using Dapper;
using NorthwindSite.Core.Domain;
using System.Linq;
using Microsoft.Data.SqlClient;

namespace NorthwindSite.Core.Data
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
