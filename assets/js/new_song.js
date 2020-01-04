$(function () {
	//Send not logged in users back
	firebase.auth().onAuthStateChanged(function (user) {
		if (!user) {
			// User is not signed in
			window.location = window.location.origin + "/songs";
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
			$(".btnText").text('Submitting...');

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
				window.location = window.location.origin + "/my_songs";
			}).fail(function () {
				alert("Error while submitting song.");
				$("#songForm :input").prop('readonly', false);
				$("#spinner").hide();
				$(".btnText").text('Submit');
			});
		});

		return false; //don't reload page
	});

	//Files can't be larger than 1MB (will also be checked server sided)
	$("#inputNBS").change(function (e) {
		if (this.files[0].size > 1048576) {
			alert("File is too big!");
			this.value = "";
		} else {
			$("#fileInputText").html(e.target.files[0].name); //update text
		}
	});
});