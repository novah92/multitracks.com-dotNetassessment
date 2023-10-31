using System.Collections.Generic;

namespace MTDataAccess.Dtos
{
    public class SongListResponseDto : SearchResponseDto
    {
        public List<SongDto> SongList { get; set; }
    }
}
