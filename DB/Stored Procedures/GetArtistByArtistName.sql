CREATE PROCEDURE dbo.GetArtistByArtistName
	@ArtistName VARCHAR(100)
AS
BEGIN

	SELECT
        ArtistId = Artist.[artistID],
		ArtistName = Artist.[title],
		ArtistBio = Artist.[biography],
		ArtistImageUrl = Artist.[imageURL],
		ArtistHeroImageUrl = Artist.[heroURL]
	FROM
		dbo.Artist
	WHERE
		Artist.title LIKE '%' + @ArtistName + '%'

END
