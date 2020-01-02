$(function () {
	//Send not logged in users back
	firebase.auth().onAuthStateChanged(function (user) {
		if (!user) {
			// User is not signed in, send them back
			window.history.back();
		}
	});

	//On form submit
	$("#songForm").submit(function (event) {

		//Get token of user
		firebase.auth().currentUser.getIdToken().then(function (token) {

			//disable the default form submission
			event.preventDefault();

			var form = $("#songForm").get(0);
			var formdata = new FormData(form);

			$("#songForm :input").prop('readonly', true);
			$("#spinner").show();
			$("#btnSubmit").html('Uploading...');

			$.ajax({
				url: 'https://us-central1-open-note-block-studio.cloudfunctions.net/addSong',
				data: formdata,
				cache: false,
				contentType: false,
				async: false,
				dataType: "json",
				crossDomain: true,
				processData: false,
				type: 'POST',
				beforeSend: function (xhr) {
					xhr.setRequestHeader('Authorization', 'Bearer ' + token);
				}
			}).done(function () {
				alert("Song submitted!");
				$("#songForm :input").prop('readonly', false);
				window.location = "/songs";
			}).fail(function () {
				alert("Error while submitting song.");
				$("#songForm :input").prop('readonly', false);
				$("#spinner").hide();
				$("#btnSubmit").html('Submit');
			});
		});

		return false; //don't reload page
	});

	//Files can't be larger than 1MB (will also be checked server sided)
	$("#inputNBS").change(function () {
		if (this.files[0].size > 1048576) {
			alert("File is too big!");
			this.value = "";
		}
	});
});