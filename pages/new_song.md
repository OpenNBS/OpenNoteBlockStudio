---
permalink: /songs/new/
---

<section id="banner">
	<h2>Upload New Song</h2>
</section>
<!-- One -->
<section id="one" class="wrapper style2">
<div class="container">
	<div class="small-middle-container">
		<form action="#" id="songForm" name="songForm">
			<div class="form-group">
				<label for="inputName">Song Name</label>
				<input type="text" name="name" class="form-control" id="inputName" placeholder="Enter song name" required>
			</div>
			<div class="form-group">
				<label for="inputAuthor">Author</label>
				<input type="text" name="author" class="form-control" id="inputAuthor" placeholder="Author" required>
			</div>
			<div class="form-group">
				<label for="inputOriginalAuthor">Original Author (optional)</label>
				<input type="text" name="originalAuthor" class="form-control" id="inputOriginalAuthor" placeholder="Original Author">
			</div>
			<div class="form-group">
				<label for="inputNBS">NBS file</label>
				<input type="file" name="nbsFile" class="form-control-file" aria-describedby="fileLimit" id="inputNBS" accept=".nbs" required>
				<small id="fileLimit" class="form-text text-muted">Max file size: 1mb.</small>
			</div>
			<br>
			<button type="submit" id="btnSubmit">Submit</button>
		</form>
		<script src="{{ '/assets/js/newsong.js' | absolute_url}}"></script>
	</div>
	</div>
</section>