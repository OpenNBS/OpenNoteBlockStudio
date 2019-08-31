$(function () {
	//Send not logged in users back
	firebase.auth().onAuthStateChanged(function (user) {
		if (!user) {
			// User is not signed in, send them back
			window.history.back();
		}
	});

	//On form submit
	$(document).on('submit', '#songForm', function () {
		var nbs_file = document.getElementById('inputNBS').files[0];

		if (validateForm(nbs_file)) {
			uploadFile(nbs_file);
		}
		//dont refresh page
		return false;
	});

	//Files can't be larger than 1mb
	$("#inputNBS").change(function () {
		if (this.files[0].size > 1048576) {
			alert("File is too big!");
			this.value = "";
		};
	});
});

function uploadFile(nbs_file) {
	// Create a root reference
	var storageRef = firebase.storage().ref();
	var uploadTask = storageRef.child('songs/' + nbs_file.name).put(nbs_file);

	uploadTask.on('state_changed', function (snapshot) {
	}, function (error) {
		console.error("Error uploading file: ", error);
	}, function () {
		// Handle successful uploads on complete
		uploadTask.snapshot.ref.getDownloadURL().then(function (downloadURL) {
			uploadSong(downloadURL);
		});
	});
}

function uploadSong(downloadUrl) {
	var name = document.forms["songForm"]["name"].value;
	var author = document.forms["songForm"]["author"].value;
	var original_author = document.forms["songForm"]["originalAuthor"].value;

	var songObject = {
		name: name,
		author: author,
		original_author: original_author,
		download_url: downloadUrl
	};

	db.collection("songs").add(songObject)
		.then(function (docRef) {
			console.log("Document written with ID: ", docRef.id);
		})
		.catch(function (error) {
			console.error("Error adding document: ", error);
		});
}

function validateForm(nbs_file) {
	var name = document.forms["songForm"]["name"].value;
	var author = document.forms["songForm"]["author"].value;

	if (name == "") {
		window.alert("Please enter a name.");
		name.focus();
		return false;
	}

	if (author == "") {
		window.alert("Please enter an author.");
		author.focus();
		return false;
	}

	if (nbs_file === undefined) {
		window.alert("Please select a file");
		nbsFile.focus();
		return false;
	}
	return true;
}