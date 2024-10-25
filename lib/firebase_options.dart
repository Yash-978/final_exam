// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyChzEDymMu2EmCc5am8JBxuKpiofOGMtWU',
    appId: '1:686756519620:web:3a9187767788c4c89cb391',
    messagingSenderId: '686756519620',
    projectId: 'flutter-exam-145fc',
    authDomain: 'flutter-exam-145fc.firebaseapp.com',
    storageBucket: 'flutter-exam-145fc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDncobqtHfoG39YqBlglzgPHm0Q4z887Qk',
    appId: '1:686756519620:android:4578329f0d068e3d9cb391',
    messagingSenderId: '686756519620',
    projectId: 'flutter-exam-145fc',
    storageBucket: 'flutter-exam-145fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2KOXvITrQhmvF2eFoyO5frNrxyWyOblI',
    appId: '1:686756519620:ios:ee5a63f09e8fc3cb9cb391',
    messagingSenderId: '686756519620',
    projectId: 'flutter-exam-145fc',
    storageBucket: 'flutter-exam-145fc.appspot.com',
    iosBundleId: 'com.example.finalExam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2KOXvITrQhmvF2eFoyO5frNrxyWyOblI',
    appId: '1:686756519620:ios:ee5a63f09e8fc3cb9cb391',
    messagingSenderId: '686756519620',
    projectId: 'flutter-exam-145fc',
    storageBucket: 'flutter-exam-145fc.appspot.com',
    iosBundleId: 'com.example.finalExam',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyChzEDymMu2EmCc5am8JBxuKpiofOGMtWU',
    appId: '1:686756519620:web:60a6ae53ceef92f29cb391',
    messagingSenderId: '686756519620',
    projectId: 'flutter-exam-145fc',
    authDomain: 'flutter-exam-145fc.firebaseapp.com',
    storageBucket: 'flutter-exam-145fc.appspot.com',
  );
}