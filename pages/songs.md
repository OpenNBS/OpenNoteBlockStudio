---
permalink: /songs/
---

<section id="banner">
	<h2>Songs</h2>
	<p>Share your note block songs here!</p>
	<ul class="actions vertical">
		<li><a class="button special icon fa-upload big" id="uploadSongBtn" href="{{'/signin' | absolute_url}}">Sign in to upload</a></li>
	</ul>
</section>
<!-- One -->
<section id="one" class="wrapper style2">
	<div class="container">
		<div id="songList">
			<input class="search" />
			<span class="sort button small" data-sort="name">Sort by name</span>
			<span class="sort button small" data-sort="author">Sort by author</span>
			<ul class="list">
			</ul>
			<ul class="pagination"></ul>
		</div>
		<!-- List item template -->
		<div style="display:none;">
			<li id="song-item" class="row songItem">
				<div class="col-sm">
					<strong>Name:</strong> 	<p class="name"></p>
				</div>
				<div class="col-sm">
					<strong>Author:</strong>	<p class="author"></p>
				</div>
				<div class="col-sm">
					<strong>Original author:</strong> <p class="original_author"></p>
				</div>
				<div class="col-sm">
					<strong>Download:</strong> <p><a class="download_link icon fa-download"></a></p>
				</div>
			</li>
		</div>
		<script src="{{ '/assets/js/songs.js' | absolute_url}}"></script>
	</div>
</section>