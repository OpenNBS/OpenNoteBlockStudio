---
permalink: /my_songs/
---

<section id="banner">
	<h2>My songs</h2>
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
					<strong></strong> <p><a class="download">Download</a></p>
				</div>
                <div class="col-sm">
					<strong></strong> <p><a class="update">Update</a></p>
				</div>
                <div class="col-sm">
					<strong></strong> <p><a class="delete">Delete</a></p>
				</div>
			</li>
		</div>
		<script src="{{ '/assets/js/my_songs.js' | absolute_url}}"></script>
	</div>
</section>