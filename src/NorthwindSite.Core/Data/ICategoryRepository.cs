using System;
using System.Collections.Generic;
using System.Text;
using NorthwindSite.Core.Domain;

namespace NorthwindSite.Core.Data
{
  public interface ICategoryRepository
  {
    public IEnumerable<Category> GetCategories();
  }
}
