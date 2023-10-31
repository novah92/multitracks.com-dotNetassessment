CREATE PROCEDURE dbo.GetSongsByAlbumId
	@AlbumId INT
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
		Song.[albumID] = @AlbumId
    ORDER BY
        Song.title

END
