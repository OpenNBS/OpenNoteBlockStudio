var options = {
    valueNames: [
      'name',
      'author',
      'original_author',
      { name: 'download_link', attr: 'href' },
      'date',
    ],
    page: 10,
    pagination: true,
    item: 'song-item'
  };

var songList = new List('songList', options);

$(function () {
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            // User is signed in.
            $('#uploadSongBtn').html("Upload your own").prop("href", "/songs/new");
        }
    });

    db.collection("songs").get().then(function (querySnapshot) {
        querySnapshot.forEach(function (doc) {
            var data = doc.data();
            songList.add({
                name: data.name,
                author: data.author,
                original_author: data.original_author,
                download_link: data.download_url,
                data: 0
              });
        });
    });
});



