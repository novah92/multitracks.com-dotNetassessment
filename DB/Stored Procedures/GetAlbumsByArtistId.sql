CREATE PROCEDURE dbo.GetAlbumsByArtistId
	@ArtistId INT
AS
BEGIN

	SELECT
		AlbumId = Album.[albumID],
		DateCreated = Album.[dateCreation],
		ArtistName = Artist.[title],
		AlbumTitle = Album.[title],
        AlbumImageUrl = Album.[imageURL],
		ReleaseYear = Album.[year]
	FROM
		dbo.Artist
		INNER JOIN dbo.Album ON Artist.artistID = Album.artistID
	WHERE
		Artist.[artistID] = @ArtistId
    ORDER BY
        Album.[year]

END
