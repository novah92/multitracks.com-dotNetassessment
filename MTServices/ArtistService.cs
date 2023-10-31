using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using DataAccess;
using MTDataAccess.Dtos;
using MTServices.Interfaces;

namespace MTServices
{
    public class ArtistService : IArtistService
    {
        private readonly IAlbumService AlbumService;

        public ArtistService(IAlbumService albumService)
        {
            AlbumService = albumService;
        }

        public ArtistListResponseDto GetArtistByArtistName(string artistName, string sort, int pageNumber, int pageSize)
        {
            var sql = new SQL();
            sql.Parameters.Add("@ArtistName", artistName);

            var artistDataTable = sql.ExecuteStoredProcedureDT("GetArtistByArtistName");

            if (artistDataTable.Rows == null) return new ArtistListResponseDto();
            if (artistDataTable.Rows.Count < 1) return new ArtistListResponseDto();

            var artistList = PopulateArtistList(artistDataTable);

            var isAscending = string.IsNullOrWhiteSpace(sort) ||
                sort.Equals("asc", StringComparison.InvariantCultureIgnoreCase);

            var sortedArtists = isAscending
                ? artistList.OrderBy(a => a.Name)
                : artistList.OrderByDescending(a => a.Name);

            var totalArtists = sortedArtists.Count();
            var totalPages = totalArtists < pageSize
                ? 1
                : totalArtists / pageSize;

            return new ArtistListResponseDto
            {
                CurrentPage = pageNumber,
                TotalItems = totalArtists,
                TotalPages = totalPages,
                ArtistList = sortedArtists.ToList()
            };
        }

        private List<ArtistDto> PopulateArtistList(DataTable artistDataTable)
        {
            var artistList = new List<ArtistDto>();

            foreach (DataRow artistRow in artistDataTable.Rows)
            {
                var artistId = Convert.ToInt32(artistRow["ArtistId"].ToString());

                artistList.Add(new ArtistDto
                {
                    ArtistId = artistId,
                    Name = artistRow["ArtistName"].ToString(),
                    Bio = artistRow["ArtistBio"].ToString(),
                    ImageUrl = artistRow["ArtistImageUrl"].ToString(),
                    HeroImageUrl = artistRow["ArtistHeroImageUrl"].ToString(),
                    Albums = AlbumService.GetAlbumsByArtistId(artistId)
                });
            }

            return artistList;
        }

        public int AddArtist(ArtistDto artistDto)
        {
            var sql = new SQL();
            sql.Parameters.Add("@ArtistName", artistDto.Name);
            sql.Parameters.Add("@ArtistBio", artistDto.Bio);
            sql.Parameters.Add("@ArtistImageUrl", artistDto.ImageUrl);
            sql.Parameters.Add("@ArtistHeroImageUrl", artistDto.HeroImageUrl);

            try
            {
                sql.ExecuteStoredProcedure("InsertArtist");
            }
            catch
            {
                return 0;
            }

            return 1;
        }
    }
}
