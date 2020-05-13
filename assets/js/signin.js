

// FirebaseUI config.
var uiConfig = {
    signInSuccessUrl: 'songs',
    signInOptions: [
        // Leave the lines as is for the providers you want to offer your users.
        firebase.auth.GoogleAuthProvider.PROVIDER_ID,
        firebase.auth.GithubAuthProvider.PROVIDER_ID
    ],
    // tosUrl and privacyPolicyUrl accept either url string or a callback
    // function.
    // Terms of service url/callback.
    tosUrl: function () {
        location.href = "terms_of_service";
    },
    // Privacy policy url/callback.
    privacyPolicyUrl: function () {
        location.assign('privacy_policy');
    }
};

// Initialize the FirebaseUI Widget using Firebase.
var ui = firebaseui.auth.AuthUI.getInstance() || new firebaseui.auth.AuthUI(firebase.auth());

// The start method will wait until the DOM is loaded.
ui.start('#firebaseui-auth-container', uiConfig);

firebase.auth().onAuthStateChanged(function (user) {
    if (user) {
        // User is signed in.
        window.location = "songs";
    }
});