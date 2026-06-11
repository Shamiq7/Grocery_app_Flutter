import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// signup(String mail, String password) async {
//   try {
//     final credential = await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: mail, password: password);

//     print('////////// Success ////////////');
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       print('The account already exists for that email.');
//     }
//   } catch (e) {
//     print(e);
//   }
// }

Future<void> signup(String mail, String password) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: mail,
    password: password,
  );
}

Future<void> login(String mail, String password) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: mail,
    password: password,
  );
}
