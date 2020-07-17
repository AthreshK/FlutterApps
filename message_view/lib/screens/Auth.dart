import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseUser user;

Future signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  user = authResult.user;

  // Checking if email and name is null

//  Only taking the first part of the name, i.e., First Name
//  if (name.contains(" ")) {
//    name = name.substring(0, name.indexOf(" "));
//  }
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
