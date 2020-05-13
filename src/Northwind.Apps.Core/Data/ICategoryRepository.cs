using System.Collections.Generic;
using Northwind.Core.Domain;

namespace Northwind.Core.Data
{
  public interface ICategoryRepository
  {
    public IEnumerable<Category> GetCategories();
  }
}
