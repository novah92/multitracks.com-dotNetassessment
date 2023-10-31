using System.Collections.Generic;
using MTDataAccess.Dtos;

namespace MTServices.Interfaces
{
    public interface IAlbumService
    {
        public List<AlbumDto> GetAlbumsByArtistId(int artistId);
    }
}
