var options = {
    valueNames: [
        'id',
        'name',
        'author',
        'original_author',
        { name: 'download', attr: 'href' },
        'date',
        { name: 'timestamp', attr: 'data-timestamp' },
        { name: 'accept', attr: 'onclick' },
        { name: 'deny', attr: 'onclick' }
    ],
    page: 10,
    pagination: [{ left: 5, right: 10 }],
    item: 'song-item'
};

var songList = new List('songList', options);

$(function () {
    firebase.auth().onAuthStateChanged(function (user) {
        if (!user) {
            // User is not signed in
            window.location = "songs";
        } else {
            db.collection("users").doc(user.uid).get().then(function (doc) {

                if (!doc.data()) {
                    window.location = "songs";
                    return;
                }

                var data = doc.data();
                if (!data.admin) {
                    window.location = "songs";
                    return;
                }

                //Get all songs
                db.collectionGroup("songs").where("status", "==", 0).get().then(function (querySnapshot) {
                    var itemId = 0;
                    querySnapshot.forEach(function (doc) {
                        var data = doc.data();
                        songList.add({
                            id: itemId,
                            name: data.name,
                            author: data.author,
                            original_author: data.original_author,
                            download: data.download_url,
                            date: data.date.toDate().toLocaleDateString('en-GB', {
                                day: 'numeric', month: 'short', year: 'numeric'
                            }).replace(/ /g, ' '),
                            timestamp: data.date.toDate().getTime(),
                            accept: "accept_song(\'" + doc.id + "\',1,this)",
                            deny: "accept_song(\'" + doc.id + "\',2,this)",
                        });
                        itemId++;
                    });

                    //Sort songs by date
                    songList.sort("timestamp", { order: "desc" });
                });
            });
        }
    });
});


function accept_song(id, accept, element) {
    db.collectionGroup("songs").where('id', '==', id).get().then(function (querySnapshot) {
        querySnapshot.forEach(function (doc) {
            var data = doc.data();
            data.status = accept;
            doc.ref.update(data).then(function () {
                var li = element.closest('li');
                var itemId = li.childNodes[1].textContent;

                songList.remove('id', itemId);
            }).catch(function (error) {
                // The document probably doesn't exist.
                alert("Error updating document: ", error);
            });
        });
    });
}