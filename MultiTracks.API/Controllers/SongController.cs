using Microsoft.AspNetCore.Mvc;
using MTDataAccess.Dtos;
using MTServices.Interfaces;

namespace MultiTracks.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SongController : ControllerBase
    {
        private readonly ISongService _songService;

        public SongController(ISongService songService)
        {
            _songService = songService;
        }

        [HttpGet]
        [Route("list")]
        public SongListResponseDto ListSongs(
            [FromQuery] string search,
            [FromQuery] string sort,
            [FromQuery] int? page,
            [FromQuery] int? size)
        {
            var pageNumber = page ?? 1;
            var pageSize = size ?? 5;

            var result = _songService.GetSongs(search, sort, pageNumber, pageSize);

            return result;
        }
    }
}
