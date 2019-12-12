import 'package:brewcrew/models/users.dart';
import 'package:brewcrew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user object basred on firebase user
  User _userfrmfirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth changes user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userfrmfirebaseUser(user));
        .map(_userfrmfirebaseUser);
  }

  //sign in annom
  Future signinanom() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      //Create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'New Member', 100);
      return _userfrmfirebaseUser(user).uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in using email and password
  Future signinWithEmailPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userfrmfirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register using email and pass
  Future registerWithEmailPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      //Create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'New Member', 100);
      
      return _userfrmfirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signin using google
  // Future signinWithGoogle()async{
  //   try {
  //     AuthResult result = await _auth.s
  //   } catch (e) {
  //   }
  // }




  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
