---
permalink: /dashboard/
---

<section id="banner">
	<h2>Dashboard</h2>
</section>
<section id="one" class="wrapper style2">
	<div class="container">
		<div id="songList">
			<div id="searchOptions">
			<input class="search" placeholder="Search Song.."/>
			<span class="sort button small" data-sort="name">Sort by name</span>
			<span class="sort button small" data-sort="author">Sort by author</span>
			<span class="sort button small" data-sort="timestamp">Sort by date</span>
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
					<strong>Date</strong> 	<p class="date timestamp" data-timestamp=""></p>
				</div>
				<div class="col-sm">
					<strong>Download</strong> <p><a class="download icon fa-download"></a></p>
				</div>
                <div class="col-sm">
					<strong>Accept </strong> <p><a class="accept icon fa-check" href="javascript:void(0);" style="color: green;"></a></p>
				</div>
				<div class="col-sm">
					<strong>Deny </strong> <p><a class="deny icon fa-close" href="javascript:void(0);" style="color: red;"></a></p>
				</div>
			</li>
		</div>
		<script src="{{ '/assets/js/dashboard.js' | absolute_url}}"></script>
	</div>
</section>