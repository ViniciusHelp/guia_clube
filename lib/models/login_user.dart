import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:guia_clube/models/user.dart';

import 'firebase_errors.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class UserManeger extends GetxController {
  Users users;
  bool _loading = false;
  bool get loading => _loading;
  bool get isLoggedIn => users != null;

  String errorMessage;

  // UserManeger() {
  //   _loadCurrentUser();
  // }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final FacebookLogin facebookSignIn = new FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  Future<Null> loginFacebook({Function onFail}) async {
    loading = true;
    final FacebookLoginResult result =
        await facebookSignIn.logIn(['email', 'public_profile']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessTo = result.accessToken;
        final credential = FacebookAuthProvider.credential(accessTo.token);
        final autResult = await _auth.signInWithCredential(credential);
        if (autResult.user != null) {
          final firebaseUser = autResult.user;
          users = Users(
            id: firebaseUser.uid,
            name: firebaseUser.displayName,
            email: firebaseUser.email,
          );
          await users.saveData();
        }
        print('''
         Logged in!

         Token: ${accessTo.token}
         User id: ${accessTo.userId}
         Expires: ${accessTo.expires}
         Permissions: ${accessTo.permissions}
         Declined permissions: ${accessTo.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        //onFail(result.errorMessage);
        print(result.errorMessage);
        break;
    }
    loading = false;
  }

  Future<Null> logOutFacebook() async {
    await facebookSignIn.logOut();
    print('Saiu fora com facebook');
  }

///////////////////////////////////////////////////

  loginGoogle() async {
    GoogleSignInAccount user = _googleSignIn.currentUser;
    if (user == null) user = await _googleSignIn.signIn();
    if (_auth.currentUser == null) {
      GoogleSignInAuthentication credentials =
          await _googleSignIn.currentUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: credentials?.idToken, accessToken: credentials?.accessToken);

      User user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.email);
      print("signed in " + user.displayName);

      return user?.uid != null;
    }

    // GoogleSignInAuthentication credentials =
    //       await _googleSignIn.currentUser.authentication;
    //   AuthCredential credential = GoogleAuthProvider.credential(
    //       idToken: credentials?.idToken, accessToken: credentials?.accessToken);

    //   FirebaseUser user =
    //      (await auth.signInWithCredential(credential)).user;
    //  print("signed in " + user.email);
    //  print("signed in " + user.displayName);

    //   return user?.uid != null;
  }

  set loading(bool value) {
    _loading = value;
    //notifyListeners();
  }

  // Future<void> createUser({Users users, Function onFail}) async {
  //   loading = true;
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: users.email, password: users.password);
  //     print("User: $userCredential");
  //     users.id = userCredential.user.uid;
  //     this.users = users;
  //     await users.saveData();
  //     print(userCredential.user.uid);
  //   }catch (e) {
  //     print(getErrorString(e.code));
  //     onFail(getErrorString(e.code));
  //   }
  //   loading = false;
  // }

  // Future<void> signOut() async {
  //   await auth.signOut();
  //   users = null;
  //   //notifyListeners();
  // }

  // Future<void> recoverPass({Users users, Function onSucess, Function onFail}) async {
  //   loading = true;
  //   try {
  //     await auth.sendPasswordResetEmail(email: users.email);
  //     print('enviado');
  //     onSucess();
  //   } catch (e) {
  //     print('deu ruim $e');
  //     onFail();
  //   }
  //   loading = false;
  // }

  // Future<void> loginUser(
  //     {Users users, Function onFail, Function onSucess}) async {
  //   loading = true;
  //   try {
  //     final UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //             email: users.email, password: users.password);
  //     await _loadCurrentUser(user: userCredential.user);
  //     print(userCredential.user.uid);
  //     print("User: $userCredential");
  //   } catch (e) {
  //     if (Platform.isAndroid) {
  //       switch (e.message) {
  //         case 'There is no user record corresponding to this identifier. The user may have been deleted.':
  //           errorMessage = "E-mail não existe ou foi excluído.";
  //           break;
  //         case 'The password is invalid or the user does not have a password.':
  //           errorMessage = "Senha ou e-mail inválidos.";
  //           break;
  //         case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
  //           errorMessage = "Ocorreu um erro de rede.";
  //           break;
  //         default:
  //            errorMessage = "Ocorreu um erro inesperado.";
  //           print('Caso ${e.message} não implementado');
  //       }
  //     } else if (Platform.isIOS) {
  //       switch (e.code) {
  //         case 'Error 17011':
  //           errorMessage = "E-mail não existe ou foi excluído.";
  //           errorType = authProblems.UserNotFound;
  //           break;
  //         case 'Error 17009':
  //           errorMessage = "A senha é inválida.";
  //           errorType = authProblems.PasswordNotValid;
  //           break;
  //         case 'Error 17020':
  //           errorMessage = "Ocorreu um erro de rede.";
  //           errorType = authProblems.NetworkError;
  //           break;
  //         ...
  //         default:
  //           errorMessage = "Ocorreu um erro inesperado.";
  //           print('Caso ${e.message} não implementado');
  //       }
  //     }
  //     print('O erro é ESSE AQUI $errorMessage');
  //     onFail(errorMessage);
  //     onFail(getErrorString(errorType.toString()));

  //     print('Deu ruim no Platform');
  //     print(getErrorString(e.code));
  //     print(getErrorString(e.message));
  //     print(getErrorString(e.stacktrace));
  //     print(getErrorString(e.details));
  //     onFail(getErrorString(e.code));
  //   }
  //   loading = false;
  // }

  // Future<void> _loadCurrentUser({User user}) async {
  //   final User currentUSer = user ?? auth.currentUser;
  //   if (currentUSer != null) {
  //     final DocumentSnapshot docUser =
  //         await firestore.collection('users').doc(currentUSer.uid).get();
  //     users = Users.fromDocument(docUser);
  //     print(users.name);
  //     print(users.email);
  //     print(users.id);
  //     notifyListeners();
  //   }
  // }
}
