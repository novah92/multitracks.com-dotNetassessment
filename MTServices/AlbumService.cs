using System;
using System.Collections.Generic;
using System.Data;
using DataAccess;
using MTDataAccess.Dtos;
using MTServices.Interfaces;

namespace MTServices
{
    public class AlbumService : IAlbumService
    {
        private readonly ISongService SongService;

        public AlbumService(ISongService songService)
        {
            SongService = songService;
        }

        public List<AlbumDto> GetAlbumsByArtistId(int artistId)
        {
            var sql = new SQL();
            sql.Parameters.Add("@ArtistId", artistId);

            var albumDataTable = sql.ExecuteStoredProcedureDT("GetAlbumsByArtistId");

            var albumList = new List<AlbumDto>();

            if (albumDataTable.Rows == null) return albumList;
            if (albumDataTable.Rows.Count < 1) return albumList;

            foreach (DataRow albumRow in albumDataTable.Rows)
            {
                var albumId = Convert.ToInt32(albumRow["AlbumId"].ToString());

                albumList.Add(new AlbumDto
                {
                    AlbumId = albumId,
                    DateCreated = Convert.ToDateTime(albumRow["DateCreated"].ToString()),
                    Title = albumRow["AlbumTitle"].ToString(),
                    ImageUrl = albumRow["AlbumImageUrl"].ToString(),
                    ReleaseYear = Convert.ToInt32(albumRow["ReleaseYear"].ToString()),
                    Songs = SongService.GetSongsByAlbumId(albumId)
                });
            }

            return albumList;
        }
    }
}
