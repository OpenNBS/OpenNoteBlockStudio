function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (m, key, value) {
        vars[key] = value;
    });
    return vars;
}

$(function () {
    firebase.auth().onAuthStateChanged(function (user) {
        if (!user) {
            // User is not signed in
            window.location = "/songs";
        } else {
            var id = getUrlVars()["id"];

            //Get all songs from user
            db.collection("users").doc(user.uid).collection("songs").doc(id).get().then(function (doc) {

                //If document doesn't exist, go back
                if (!doc._document) {
                    window.location = "/my_songs";
                }
                var data = doc.data();
                $("#inputName").val(data.name);
                $("#inputOriginalAuthor").val(data.original_author);
                $("#fileInputText").html(data.nbs_name);
            });
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
            $(".spinner").show();
            $(".btnText").text('Uploading...');

            var update_id = getUrlVars()["id"];

            $.ajax({
                url: 'https://us-central1-open-note-block-studio.cloudfunctions.net/updateSong',
                data: formdata,
                cache: false,
                contentType: false,
                async: false,
                dataType: "json",
                crossDomain: true,
                processData: false,
                type: 'POST',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('UpdateID', update_id);
                    xhr.setRequestHeader('Authorization', 'Bearer ' + token);
                }
            }).done(function () {
                window.location = "/my_songs";
            }).fail(function () {
                $("#songForm :input").prop('readonly', false);
                $(".spinner").hide();
                $(".btnText").text('Save changes');
                alert("Error while saving changes.");
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

