using Microsoft.AspNetCore.Mvc;
using Northwind.Core.Data;

namespace Northwind.Api.Controllers
{
  [ApiController]
  [Route("[controller]")]
  public class TestController : ControllerBase
  {
    private readonly ICategoryRepository _categoryRepository;

    public TestController(ICategoryRepository categoryRepository)
    {
      _categoryRepository = categoryRepository;
    }

    [HttpGet]
    public string Get()
    {
      return _categoryRepository.GetCategories();
    }
  }
}
