import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSigninService {

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      final signInWithGoogleEndpoint = Uri(
        scheme: 'https',
        host: 'apple-google-sign-in.herokuapp.com', // Cambiar enlace
        path: '/google'
      );

      final session = await http.post(
        signInWithGoogleEndpoint,
        body: {
          'token': googleKey.idToken
        }
      );

      print('====== backend =======');
      print( session.body );

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