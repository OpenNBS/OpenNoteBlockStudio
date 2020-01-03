---
permalink: /my_songs/
---

<section id="banner">
	<h2>My songs</h2>
		<ul class="actions vertical">
		<li><a class="button special icon fa-upload big" id="uploadSongBtn" href="{{'/songs/new' | absolute_url}}">Submit new song</a></li>
	</ul>
</section>
<section id="one" class="wrapper style2">
	<div class="container">
		<div id="songList">
			<div id="searchOptions">
			<input class="search" placeholder="Search Song.."/>
			<span class="sort button small" data-sort="name">Sort by name</span>
			<span class="sort button small" data-sort="author">Sort by author</span>
			<span class="sort button small" data-sort="date">Sort by date</span>
		</div>
			<ul class="list">
			</ul>
			<ul class="pagination"></ul>
			<div id="noSongsText" style="display:none;"><h1 class="text-center"> You have no songs :( </h1></div>
		</div>
		<!-- List item template -->
		<div style="display:none;">
			<li id="song-item" class="row songItem">
				<div class="col-sm">
					<strong>Name</strong> 	<p class="name"></p>
				</div>
				<div class="col-sm">
					<strong>Original author</strong> <p class="original_author"></p>
				</div>
				<div class="col-sm">
					<strong>Date</strong> 	<p class="date"></p>
				</div>
				<div class="col-sm">
					<strong>Download</strong> <p><a class="download icon fa-download"></a></p>
				</div>
                <div class="col-sm">
					<strong>Edit</strong> <p><a class="update icon fa-pencil"></a></p>
				</div>
                <div class="col-sm">
					<strong>Delete</strong> <p><a class="delete icon fa-trash" href="javascript:void(0);"></a></p>
				</div>
                <div class="col-sm">
					<strong>Status</strong> <p><a class="status"></a></p>
				</div>
			</li>
		</div>
		<script src="{{ '/assets/js/my_songs.js' | absolute_url}}"></script>
	</div>
</section>