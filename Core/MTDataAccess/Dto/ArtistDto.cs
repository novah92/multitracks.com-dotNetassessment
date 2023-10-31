using System.Collections.Generic;

namespace MTDataAccess.Dtos
{
    public class ArtistDto
    {
        public int ArtistId { get; set; }
        public string Name { get; set; }
        public string Bio { get; set; }
        public string ImageUrl { get; set; }
        public string HeroImageUrl { get; set; }
        public List<AlbumDto> Albums { get; set; }
    }
}
