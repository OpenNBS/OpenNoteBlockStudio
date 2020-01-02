var options = {
    valueNames: [
        'name',
        'original_author',
        { name: 'download', attr: 'href' },
        { name: 'update', attr: 'href' },
        { name: 'delete', attr: 'href' },
        'date'
    ],
    page: 10,
    pagination: true,
    item: 'song-item'
};

var songList = new List('songList', options);

$(function () {
    firebase.auth().onAuthStateChanged(function (user) {
        if (!user) {
            // User is not signed in, send them back
            window.history.back();
        } else {

            //Get all songs from user
            db.collection("users").doc(user.uid).collection("songs").get().then(function (querySnapshot) {
                querySnapshot.forEach(function (doc) {
                    var data = doc.data();
                    console.log(doc.id);
                    songList.add({
                        name: data.name,
                        author: data.author,
                        original_author: data.original_author,
                        download: data.download_url,
                        date: data.date.toDate().toLocaleDateString('en-GB', {
                            day: 'numeric', month: 'short', year: 'numeric'
                        }).replace(/ /g, ' '),
                        update: "/update_song?song=" + doc.id,
                        delete: "/delete_song?song=" + doc.id
                    });
                });
            });
        }
    });
});



