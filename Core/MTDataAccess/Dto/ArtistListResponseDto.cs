using System.Collections.Generic;

namespace MTDataAccess.Dtos
{
    public class ArtistListResponseDto : SearchResponseDto
    {
        public List<ArtistDto> ArtistList { get; set; }
    }
}
