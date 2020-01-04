var options = {
    valueNames: [
        'name',
        'original_author',
        { name: 'download', attr: 'href' },
        { name: 'update', attr: 'href' },
        { name: 'delete', attr: 'onclick' },
        'date',
        'status'
    ],
    page: 10,
    pagination: true,
    item: 'song-item'
};

var songList = new List('songList', options);

$(function () {
    firebase.auth().onAuthStateChanged(function (user) {
        if (!user) {
            // User is not signed in
            window.location = window.location.origin + "/songs";
        } else {

            var songCount = 0;
            //Get all songs from user
            db.collection("users").doc(user.uid).collection("songs").get().then(function (querySnapshot) {
                querySnapshot.forEach(function (doc) {
                    var data = doc.data();

                    songCount++;
                    var status = data.status;
                    var statusText = "In review";
                    if (status == 1) {
                        statusText = "Accepted";
                    } else if (status == 2) {
                        statusText = "Denied";
                    }

                    songList.add({
                        name: data.name,
                        author: data.author,
                        original_author: data.original_author,
                        download: data.download_url,
                        date: data.date.toDate().toLocaleDateString('en-GB', {
                            day: 'numeric', month: 'short', year: 'numeric'
                        }).replace(/ /g, ' '),
                        update: "update?id=" + doc.id,
                        delete: "delete_song(\'" + doc.id + "\')",
                        status: statusText
                    });
                });

                if (songCount == 0) {
                    $("#noSongsText").show();
                }
            });
        }
    });
});

function delete_song(id) {
    var user = firebase.auth().currentUser;

    if (confirm("Are you sure you want to delete this song?")) {
        db.collection("users").doc(user.uid).collection("songs").doc(id).delete().then(function () {
            location.reload();
        }).catch(function (error) {
            alert("Could not delete song. Error: " + error);
        });
    }
}



