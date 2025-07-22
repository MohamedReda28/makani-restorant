import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User> signInWithGoogle();

  Future<User> signInWithFacebook();

  bool isLoggedIn();

  Future<void> deleteUser();

  Future<void> sendPasswordResetEmail({required String email});
}