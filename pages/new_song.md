---
permalink: /songs/new/
---

<section id="banner">
	<h2>Submit New Song</h2>
</section>
<!-- One -->
<section id="one" class="wrapper style2">
<div class="container">
	<div class="small-middle-container">
		<form id="songForm" name="songForm" method="POST" action="javascript:;" enctype="multipart/form-data">
			<div class="form-group">
				<label for="inputName">Song Name</label>
				<input type="text" name="name" class="form-control" id="inputName" placeholder="Enter song name" required>
			</div>
			<div class="form-group">
				<label for="inputOriginalAuthor">Original Author (optional)</label>
				<input type="text" name="originalAuthor" class="form-control" id="inputOriginalAuthor" placeholder="Original Author">
			</div>
			<div class="form-group">
				<label for="inputNBS">NBS file</label>
				<label for="inputNBS" id="fileInputText" class="btn btn-primary btn-outlined"> Select...</label>
				<input type="file" name="nbsFile" class="form-control-file" aria-describedby="fileLimit" id="inputNBS" accept=".nbs" style="display: none">
				<small id="fileLimit" class="form-text text-muted">Max file size: 1MB.</small>
			</div>
			<br>
			<button type="submit" id="btnSubmit"> 
				<span id="spinner" class="spinner-border spinner-border-sm" role="status" aria-hidden="true" style="display:none"></span>
			 	<span class="btnText">Submit</span>
			</button>
		</form>
		<script src="{{ '/assets/js/new_song.js' | absolute_url}}"></script>
	</div>
	</div>
</section>