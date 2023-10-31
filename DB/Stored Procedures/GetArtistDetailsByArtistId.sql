CREATE PROCEDURE dbo.GetArtistDetailsByArtistId
	@ArtistId INT
AS
BEGIN

	SELECT
		ArtistName = Artist.[title],
		ArtistBio = Artist.[biography],
		ArtistImageUrl = Artist.[imageURL],
		ArtistHeroImageUrl = Artist.[heroURL]
	FROM
		dbo.Artist
	WHERE
		artistID = @ArtistId

END
