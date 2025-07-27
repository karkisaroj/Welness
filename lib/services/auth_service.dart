import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:welness/models/user.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static AppUser? _currentUser;
  static const String adminEmail = 'admin@welness.com';
  static const String adminPassword = 'admin123';

  static AppUser? get currentAppUser => _currentUser;
  User? get currentFirebaseUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  static void setCurrentUser(AppUser user) {
    _currentUser = user;
  }

  static Future<bool> login(String email, String password) async {
    try {
      log("Email: '$email'");
      log("Password: '$password'");
      log("Admin Email: '$adminEmail'");
      log("Admin Password: '$adminPassword'");

      if (email == adminEmail && password == adminPassword) {
        _currentUser = AppUser(
          id: 'admin_user',
          email: adminEmail,
          userType: 'admin',
          preferences: [],
          createdAt: DateTime.now(),
        );
        log("Admin login successful. Current user: $_currentUser");
        return true;
      }

      try {
        AuthService authService = AuthService();
        UserCredential? result = await authService.signInWithEmailPassword(
          email: email,
          password: password,
        );

        if (result?.user != null) {
          log("Firebase Auth successful");

          DocumentSnapshot userDoc = await FirebaseFirestore.instance
              .collection('users')
              .doc(result!.user!.uid)
              .get();

          if (userDoc.exists) {
            _currentUser = AppUser.fromMap(
              userDoc.data() as Map<String, dynamic>,
              userDoc.id,
            );
            log("User login successful: ${_currentUser!.email}");
            return true;
          } else {
            log("User document not found in Firestore");
          }
        }
      } catch (e) {
        log("Firebase Auth login failed: $e");
      }

      log("Login failed: Invalid credentials");
      return false;
    } catch (e) {
      log("Login error: $e");
      return false;
    }
  }

  static Future<bool> register(String email, String password) async {
    try {
      log("Registering user: $email");

      AuthService authService = AuthService();

      UserCredential? result = await authService.signUpWithEmailPassword(
        email: email,
        password: password,
      );

      if (result?.user != null) {
        AppUser newUser = AppUser(
          email: email,
          userType: 'user',
          preferences: [],
          createdAt: DateTime.now(),
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(result!.user!.uid)
            .set(newUser.toMap());

        _currentUser = AppUser.fromMap(newUser.toMap(), result.user!.uid);

        log("User registered successfully");
        return true;
      }

      return false;
    } catch (e) {
      log("Registration error: $e");
      return false;
    }
  }

  static Future<bool> updatePreferences(List<String> preferences) async {
    try {
      if (_currentUser == null || _currentUser!.isAdmin) {
        return false;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser!.id)
          .update({'preferences': preferences});

      _currentUser = AppUser(
        id: _currentUser!.id,
        email: _currentUser!.email,
        userType: _currentUser!.userType,
        preferences: preferences,
        createdAt: _currentUser!.createdAt,
      );

      log("Preferences updated: $preferences");
      return true;
    } catch (e) {
      log("Error updating preferences: $e");
      return false;
    }
  }

  static Future<void> logout() async {
    _currentUser = null;
    AuthService authService = AuthService();
    await authService._auth.signOut();
    await GoogleSignIn().signOut();
    log("User logged out");
  }

  static bool get isLoggedIn => _currentUser != null;
  static bool get isAdmin => _currentUser?.userType == 'admin';
  static bool get isUser => _currentUser?.userType == 'user';

  Future<UserCredential?> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      log("Firebase Auth Error: $e");
      rethrow;
    }
  }

  Future<UserCredential?> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      log("Sign up failed: $e");
      rethrow;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);

      if (result.user != null) {
        DocumentSnapshot userDoc = await _firestore
            .collection('users')
            .doc(result.user!.uid)
            .get();

        if (!userDoc.exists) {
          AppUser newUser = AppUser(
            email: result.user!.email ?? '',
            userType: 'user',
            preferences: [],
            createdAt: DateTime.now(),
          );

          await _firestore
              .collection('users')
              .doc(result.user!.uid)
              .set(newUser.toMap());

          _currentUser = AppUser.fromMap(newUser.toMap(), result.user!.uid);
        } else {
          _currentUser = AppUser.fromMap(
            userDoc.data() as Map<String, dynamic>,
            userDoc.id,
          );
        }
      }

      return result;
    } catch (e) {
      log("Google Sign-In Error: $e");
      rethrow;
    }
  }
}
