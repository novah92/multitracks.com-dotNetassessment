CREATE PROCEDURE dbo.InsertArtist
	@ArtistName VARCHAR(100),
	@ArtistBio VARCHAR(MAX),
	@ArtistImageUrl VARCHAR(500),
	@ArtistHeroImageUrl VARCHAR(500)
AS
BEGIN

	DECLARE @ArtistId INT

	INSERT INTO dbo.Artist (
		title,
		biography,
		imageURL,
		heroURL
	) VALUES (
		@ArtistName,
		@ArtistBio,
		@ArtistImageUrl,
		@ArtistHeroImageUrl
	)

END
