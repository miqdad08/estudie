import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:online_course_app/core/resources/result.dart';
import 'auth_data_source.dart';

class FirebaseAuthService extends AuthDataSource {
  final firebase_auth.FirebaseAuth _auth;

  FirebaseAuthService({firebase_auth.FirebaseAuth? firebaseAuth})
      : _auth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return Result.success(userCredential.user!.uid);
      } else {
        return const Result.failed('Failed to login');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message ?? 'Failed to login');
    }
  }

  @override
  Future<Result<String>> register({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return Result.success(userCredential.user!.uid);
      } else {
        return const Result.failed('Failed to register user');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message ?? 'Failed to register');
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _auth.signOut();
      if (_auth.currentUser == null) {
        return const Result.success(null);
      } else {
        return const Result.failed('Failed to sign out');
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.failed(e.message??'Failed to sign out');
    }
  }

  @override
  String? getLoggedInUserId() => _auth.currentUser?.uid;
}
