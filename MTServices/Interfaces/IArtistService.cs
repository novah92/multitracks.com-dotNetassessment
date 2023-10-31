using MTDataAccess.Dtos;

namespace MTServices.Interfaces
{
    public interface IArtistService
    {
        ArtistListResponseDto GetArtistByArtistName(string artistName, string sort, int pageNumber, int pageSize);
        int AddArtist(ArtistDto artistDto);
    }
}
