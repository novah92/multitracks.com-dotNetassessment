<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArtistDetails.aspx.cs" Inherits="ArtistDetails" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- set the viewport width and initial-scale on mobile devices -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

    <!-- set the encoding of your site -->
    <meta charset="utf-8">
    <title id="PageTitle" runat="server"></title>
    <!-- include the site stylesheet -->
    <meta charset="utf-8">
    <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-32x32.png" type="image/png">
    <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-svg2.svg" type="image/svg+xml">
    <meta name="theme-color" content="#ffffff">
    <link media="all" rel="stylesheet" href="https://mtracks.azureedge.net/public/css/v22/main.min.css?v=4">
    <style type="text/css">
        .is-slide-hidden {
            position: absolute;
            left: -9999px;
            top: -9999px;
            display: block;
        }
    </style>
    <link media="all" rel="stylesheet" href="./css/index.css">
</head>
<body class="premium standard u-fix-fancybox-iframe">
    <form>
        <noscript>
            <div>Javascript must be enabled for the correct page display</div>
        </noscript>

        <!-- allow a user to go to the main content of the page -->
        <a class="accessibility" href="#main" tabindex="21">Skip to Content</a>

        <div class="wrapper mod-standard mod-gray">
            <div class="details-banner">
                <div class="details-banner--overlay"></div>
                <div class="details-banner--hero">
                    <asp:Image ID="artistHeroImage" class="details-banner--hero--img" runat="server" />
                </div>
                <div class="details-banner--info">
                    <a href="#" class="details-banner--info--box">
                        <asp:Image ID="artistImage" class="details-banner--info--box--img" runat="server" />
                    </a>
                    <h1 class="details-banner--info--name">
                        <a class="details-banner--info--name--link" href="#">
                            <asp:Literal id="artistName" runat="server" />
                        </a>
                    </h1>
                </div>
            </div>

            <nav class="discovery--nav">
                <ul class="discovery--nav--list tab-filter--list u-no-scrollbar">
                    <li class="discovery--nav--list--item tab-filter--item is-active">
                        <a class="tab-filter" href="../artists/details.aspx">Overview</a>
                    </li>
                    <li class="discovery--nav--list--item tab-filter--item">
                        <a class="tab-filter" href="../artists/songs/details.aspx">Songs</a>
                    </li>
                    <li class="discovery--nav--list--item tab-filter--item">
                        <a class="tab-filter" href="../artists/albums/details.aspx">Albums</a>
                    </li>
                </ul>
                <!-- /.browse-header-filters -->
            </nav>

            <div class="discovery--container u-container">
                <main class="discovery--section">

                    <section class="standard--holder">
                        <div class="discovery--section--header">
                            <h2>Top Songs</h2>
                            <a class="discovery--section--header--view-all" href="../artists/songs/details.aspx">View All</a>
                        </div>
                        <!-- /.discovery-select -->

                        <ul id="playlist" class="song-list mod-new mod-menu">
                            <asp:Repeater runat="server" ID="artistSongs">
                                <ItemTemplate>
                                    <li class="song-list--item media-player--row">

                                        <div class="song-list--item--player-img media-player">
                                            <img class="song-list--item--player-img--img"
                                                src="<%#Eval("AlbumImageUrl") %>" alt="<%#Eval("SongTitle") %>">
                                        </div>

                                        <div class="song-list--item--right">

                                            <a href="#" class="song-list--item--primary"><%#Eval("SongTitle") %></a>
                                            <a class="song-list--item--secondary"><%#Eval("AlbumTitle") %></a>
                                            <a class="song-list--item--secondary"><%#Eval("Bpm") %> BPM</a>
                                            <a class="song-list--item--secondary"><%#Eval("TimeSignature") %>/4</a>
                                            <div class="song-list--item--icon--holder">
                                                <%# BuildLinkHtml(SongProperty.HasMultiTracks, Eval("HasMultiTracks").ToString()) %>
                                                <%# BuildLinkHtml(SongProperty.HasCustomMix, Eval("HasCustomMix").ToString()) %>
                                                <%# BuildLinkHtml(SongProperty.HasRehearsalMix, Eval("HasRehearsalMix").ToString()) %>
                                                <%# BuildLinkHtml(SongProperty.HasPatches, Eval("HasPatches").ToString()) %>
                                                <%# BuildLinkHtml(SongProperty.HasChordChart, Eval("HasChordChart").ToString()) %>
                                                <%# BuildLinkHtml(SongProperty.HasProPresenterSlides, Eval("HasProPresenterSlides").ToString()) %>
                                            </div>
                                        </div>
                                        <!-- /.song-list-item-right -->
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <!-- /.song-list -->
                    </section>
                    <!-- /.songs-section -->

                    <div class="discovery--space-saver">
                        <section class="standard--holder">
                            <div class="discovery--section--header">
                                <h2>Albums</h2>
                                <a class="discovery--section--header--view-all" href="/artists/default.aspx">View All</a>
                            </div>
                            <!-- /.discovery-select -->

                            <div class="discovery--grid-holder">

                                <div class="ly-grid ly-grid-cranberries">

                                    <asp:Repeater runat="server" ID="artistAlbums">
                                        <ItemTemplate>
                                            <div class="media-item">
                                                <a class="media-item--img--link" href="#" tabindex="0">
                                                    <img class="media-item--img" alt="<%#Eval("AlbumTitle") %>" src="<%#Eval("AlbumImageUrl") %>"
                                                        srcset="<%#Eval("AlbumImageUrl") %>, <%#Eval("AlbumImageUrl") %> 2x">
                                                    <span class="image-tag">Master</span>
                                                </a>
                                                <a class="media-item--title" href="#" tabindex="0"><%#Eval("AlbumTitle") %></a>
                                                <a class="media-item--subtitle" href="#" tabindex="0"><%#Eval("ArtistName") %></a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                                <!-- /.grid -->
                            </div>
                            <!-- /.discovery-grid-holder -->
                        </section>
                        <!-- /.songs-section -->
                    </div>

                    <section class="standard--holder">
                        <div class="discovery--section--header">
                            <h2>Biography</h2>
                        </div>
                        <!-- /.discovery-section-header -->

                        <div class="artist-details--biography biography">
                            <asp:Literal id="artistBio" runat="server" />
                            <a href="#">Read More...</a>
                        </div>
                    </section>
                    <!-- /.biography-section -->
                </main>
                <!-- /.discovery-section -->
            </div>
            <!-- /.standard-container -->
        </div>
        <!-- /.wrapper -->



        <a class="accessibility" href="#wrapper" tabindex="20">Back to top</a>
    </form>
</body>
</html>
