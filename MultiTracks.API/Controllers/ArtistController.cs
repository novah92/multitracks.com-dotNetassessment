using Microsoft.AspNetCore.Mvc;
using MTDataAccess.Dtos;
using MTServices.Interfaces;

namespace MultiTracks.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ArtistController : ControllerBase
    {
        private readonly IArtistService _artistService;

        public ArtistController(IArtistService artistService)
        {
            _artistService = artistService;
        }

        [HttpGet]
        [Route("search")]
        public ArtistListResponseDto SearchArtist(
            [FromQuery] string search,
            [FromQuery] string sort,
            [FromQuery] int? page,
            [FromQuery] int? size)
        {
            var pageNumber = page ?? 1;
            var pageSize = size ?? 5;

            var result = _artistService.GetArtistByArtistName(search, sort, pageNumber, pageSize);

            return result;
        }

        [HttpPost]
        [Route("add")]
        public int AddArtist(ArtistDto artistDto)
        {
            var result = _artistService.AddArtist(artistDto);

            return result;
        }
    }
}
