import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninService {

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      print(account);
      print("======== ID TOKEN ========");
      print(googleKey.idToken);
      
      // TODO: idToken

      return account;
    } catch (e) {
      print("Error en Google SignIn");
      print(e);
      return null;
    }
  } 

  static Future signOut() async {
    await _googleSignIn.signOut();
  }

}