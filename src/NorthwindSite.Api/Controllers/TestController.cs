using Microsoft.AspNetCore.Mvc;
using NorthwindSite.Core.Data;

namespace NorthwindSite.Api.Controllers
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
      var t =_categoryRepository.GetCategories();
      return "success!";

    }
  }
}
