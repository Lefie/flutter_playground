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
      print(credential.user!.email);
      print(credential.user!.displayName);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }

  /*
  method to sign in an existing user
  input: email (String), password(String)
  output: Future<void>
  */
  Future<void> userSignIn({required String email, required String password}) async{
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


  // Sign out function
  Future<void> signOut() => auth.signOut();


  // get current user specific information
  void displayCurUserInfo() {
    User? credential = auth.currentUser;
    String? email = credential?.email;
    String? username = credential?.displayName;
    String? id = credential?.uid;

    print("${email}, ${username}, ${id}");

  }

}