using System;
using System.Collections.Generic;

namespace MTDataAccess.Dtos
{
    public class AlbumDto
    {
        public int AlbumId { get; set; }
        public DateTime DateCreated { get; set; }
        public ArtistDto Artist { get; set; }
        public string Title { get; set; }
        public string ImageUrl { get; set; }
        public int ReleaseYear { get; set; }
        public List<SongDto> Songs { get; set; }
    }
}
