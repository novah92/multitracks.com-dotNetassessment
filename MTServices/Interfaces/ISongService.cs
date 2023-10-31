using System.Collections.Generic;
using MTDataAccess.Dtos;

namespace MTServices.Interfaces
{
    public interface ISongService
    {
        SongListResponseDto GetSongs(string searchString, string sort, int pageNumber, int pageSize);
        List<SongDto> GetSongsByAlbumId(int albumId);
    }
}
