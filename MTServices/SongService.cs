using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using DataAccess;
using MTDataAccess.Dtos;
using MTServices.Interfaces;

namespace MTServices
{
    public class SongService : ISongService
    {
        public SongListResponseDto GetSongs(string searchString, string sort, int pageNumber, int pageSize)
        {
            var sql = new SQL();
            var songDataTable = sql.ExecuteStoredProcedureDT("GetAllSongs");
            var allSongs = GetSongList(songDataTable);

            var filteredSongs = string.IsNullOrWhiteSpace(searchString)
                ? allSongs
                : allSongs.Where(s => s.Title.ToLower().Contains(searchString.ToLower()));

            var isAscending = string.IsNullOrWhiteSpace(sort) ||
                sort.Equals("asc", StringComparison.InvariantCultureIgnoreCase);

            var sortedSongs = isAscending
                ? filteredSongs.OrderBy(s => s.Title)
                : filteredSongs.OrderByDescending(s => s.Title);

            var totalSongs = sortedSongs.Count();
            var totalPages = totalSongs < pageSize
                ? 1
                : totalSongs / pageSize;

            return new SongListResponseDto
            {
                CurrentPage = pageNumber,
                TotalItems = totalSongs,
                TotalPages = totalPages,
                SongList = sortedSongs.ToList()
            };
        }

        public List<SongDto> GetSongsByAlbumId(int albumId)
        {
            var sql = new SQL();
            sql.Parameters.Add("@AlbumId", albumId);

            var songDataTable = sql.ExecuteStoredProcedureDT("GetSongsByAlbumId");

            return GetSongList(songDataTable);
        }

        private static List<SongDto> GetSongList(DataTable songDataTable)
        {
            var songList = new List<SongDto>();

            if (songDataTable.Rows == null) return songList;
            if (songDataTable.Rows.Count < 1) return songList;

            foreach (DataRow songRow in songDataTable.Rows)
            {
                songList.Add(PopulateSongDto(songRow));
            }

            return songList;
        }

        private static SongDto PopulateSongDto(DataRow songRow)
        {
            var album = GetAlbumDto(songRow);
            var artist = GetArtistDto(songRow);

            return new SongDto
            {
                SongId = Convert.ToInt32(songRow["SongId"].ToString()),
                DateCreated = Convert.ToDateTime(songRow["DateCreated"].ToString()),
                Album = album,
                Artist = artist,
                Title = songRow["SongTitle"].ToString(),
                Bpm = Convert.ToDecimal(songRow["ArtistId"].ToString()),
                TimeSignature = songRow["TimeSignature"].ToString(),
                HasMultiTracks = Convert.ToBoolean(songRow["HasMultiTracks"].ToString()),
                HasCustomMix = Convert.ToBoolean(songRow["HasCustomMix"].ToString()),
                HasChordChart = Convert.ToBoolean(songRow["HasChordChart"].ToString()),
                HasRehearsalMix = Convert.ToBoolean(songRow["HasRehearsalMix"].ToString()),
                HasPatches = Convert.ToBoolean(songRow["HasPatches"].ToString()),
                HasSongSpecificPatches = Convert.ToBoolean(songRow["HasSongSpecificPatches"].ToString()),
                HasProPresenterSlides = Convert.ToBoolean(songRow["HasProPresenterSlides"].ToString())
            };
        }

        private static AlbumDto GetAlbumDto(DataRow songRow)
        {
            return new AlbumDto
            {
                AlbumId = Convert.ToInt32(songRow["AlbumId"].ToString()),
                ImageUrl = songRow["AlbumImageUrl"].ToString(),
                Title = songRow["AlbumTitle"].ToString()
            };
        }

        private static ArtistDto GetArtistDto(DataRow songRow)
        {
            return new ArtistDto
            {
                ArtistId = Convert.ToInt32(songRow["ArtistId"].ToString()),
                ImageUrl = songRow["ArtistImageUrl"].ToString(),
                Name = songRow["ArtistName"].ToString()
            };
        }
    }
}
