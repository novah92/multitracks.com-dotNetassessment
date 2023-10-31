CREATE PROCEDURE dbo.GetSongsByArtistId
	@ArtistId INT
AS
BEGIN

	SELECT
		AlbumImageUrl = Album.[imageURL],
		AlbumTitle = Album.[title],
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
	WHERE
		Song.[artistID] = @ArtistId
    ORDER BY
        Album.title,
        Song.title

END
