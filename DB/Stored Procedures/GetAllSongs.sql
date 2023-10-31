CREATE PROCEDURE dbo.GetAllSongs
AS
BEGIN

	SELECT
		SongId = Song.[songID],
		DateCreated = Song.[dateCreation],
		AlbumId = Song.[albumID],
		AlbumImageUrl = Album.[imageURL],
		AlbumTitle = Album.[title],
		ArtistId = Song.[artistID],
		ArtistImageUrl = Artist.[imageURL],
		ArtistName = Artist.[title],
		SongTitle = Song.[title],
		Bpm = Song.[bpm],
		TimeSignature = Song.[timeSignature],
		HasMultiTracks = Song.[multitracks],
		HasCustomMix = Song.[customMix],
		HasChordChart = Song.[chart],
		HasRehearsalMix = Song.[rehearsalMix],
		HasPatches = Song.[patches],
		HasSongSpecificPatches = Song.[songSpecificPatches],
		HasProPresenterSlides = Song.[proPresenter]
	FROM
		dbo.Song
		INNER JOIN dbo.Album ON Song.albumID = Album.albumID
		INNER JOIN dbo.Artist ON
			Song.artistID = Artist.artistID AND
			Album.artistID = Artist.artistID
    ORDER BY
        Artist.title,
        Album.title,
        Song.title

END
