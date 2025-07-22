import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:makani/core/services/services/AuthServece.dart';
import '../../erroes/excaptins.dart';




class FirebaseAuthServece implements AuthService{
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.sendEmailVerification();
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Excaption  in CreateUserWithEmailAndPassword. ${e.toString()}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمه المرور ضعيفه');
      } else if (e.code == 'invalid-email') {
        throw CustomException(
            message: 'لبريد الإلكتروني غير صالح.');
      }else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تحقق من اتصالك بالإنترنت');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'هذا الحساب موجود بالفعل');
      } else {
        throw CustomException(message: 'حدث خطأ,حاول لاحقا');
      }
    } catch (e) {
      log('Excaption  in CreateUserWithEmailAndPassword. ${e.toString()}');
      throw CustomException(message: 'حدث خطأ,حاول لاحقا');
    }
  }


  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.emailVerified) {
        return credential.user!;
      } else {
        // إذا لم يتم التحقق، نرمي استثناء مخصص
        throw CustomException(message: 'البريد الإلكتروني لم يتم تأكيده بعد');
      }

    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw CustomException(message: 'البريد الإلكتروني أو كلمة المرور غير صحيحة');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(message: 'عدد كبير من المحاولات، حاول لاحقاً');
      } else if (e.code == 'invalid-email' || e.code == 'invalid-credential') {
        throw CustomException(message: 'البريد الإلكتروني أو كلمة المرور غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'قم بالاتصال بالإنترنت');
      } else {
        throw CustomException(message: 'حدث خطأ، حاول لاحقاً');
      }
    } catch (e) {
      // هنا يتم التقاط CustomException أو أي استثناء آخر
      log('Other Exception: ${e.toString()}');
      if (e is CustomException) {
        rethrow; // نعيد رميه عشان يظهر في السناك بار زي ما تحب
      } else {
        throw CustomException(message: 'حدث خطأ، حاول لاحقاً');
      }
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // المستخدم لغى تسجيل الدخول
      throw CustomException(message: 'لم تكتمل عمليه التسجيل'); // نعمل اكسبشن خاص
    }
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      log('Exception in sendPasswordResetEmail: ${e.toString()}');
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'لا يوجد حساب مرتبط بهذا البريد الإلكتروني');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'صيغة البريد الإلكتروني غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'يرجى التحقق من الاتصال بالإنترنت');
      } else {
        throw CustomException(
            message: 'حدث خطأ أثناء إرسال الرابط، حاول لاحقًا');
      }
    } catch (e) {
      log('Unknown exception in sendPasswordResetEmail: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ غير متوقع، حاول لاحقًا');
    }
  }
}
