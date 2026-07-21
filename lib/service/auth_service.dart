import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

 /*
  method to sign up a new user
  input: email (String), password(String)
  output: Future<void>
  */
  Future<void> userSignUp({required String email, required String password, required String username}) async{

    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.updateDisplayName(username);


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Please enter a valid email address.');
      } else {
        throw Exception('Sign up failed. Please try again.');
      }
    } catch (e) {
      throw Exception("something went wrong, please try again");
    }

  }

  /*
  method to sign in an existing user
  input: email (String), password(String)
  output: Future<void>
  */
  Future<void> userSignIn({required String email, required String password}) async{
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Please enter a valid email address.');
      } else if (e.code == 'invalid-credential') {
        throw Exception('The email or password is incorrect.');
      } else {
        throw Exception('Sign in failed. Please try again.');
      }
    }
  }


  // Sign out function
  Future<void> signOut() => auth.signOut();


  // get current user specific information
  void displayCurUserInfo() {
    User? credential = auth.currentUser;
    if(credential != null) {
      print(credential.providerData);

      for (final providerProfile in credential.providerData ) {
        print(providerProfile.providerId);
        print(providerProfile.uid);
        print(providerProfile.displayName);
        print(providerProfile.email);

      }

    }


  }

}