// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC1EghigIbZ5dmVY1Ivicyq4yrnOVzUJDg',
    appId: '1:71145577143:web:74eeece48f52e9e1774b32',
    messagingSenderId: '71145577143',
    projectId: 'fiscal-81d65',
    authDomain: 'fiscal-81d65.firebaseapp.com',
    storageBucket: 'fiscal-81d65.appspot.com',
    measurementId: 'G-HDQ0HZREL8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSCMx9mDidsP89tsD7psZHP2GGkBZmF3g',
    appId: '1:71145577143:android:66ec9e14c8b4a18d774b32',
    messagingSenderId: '71145577143',
    projectId: 'fiscal-81d65',
    storageBucket: 'fiscal-81d65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7oI1BWqznw8SeJVNwzZJb25_f6bS-LAI',
    appId: '1:71145577143:ios:4885e5973f136a64774b32',
    messagingSenderId: '71145577143',
    projectId: 'fiscal-81d65',
    storageBucket: 'fiscal-81d65.appspot.com',
    iosClientId: '71145577143-i2j8rukcus96uv60v0536tpa597s87k1.apps.googleusercontent.com',
    iosBundleId: 'com.example.fiscal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7oI1BWqznw8SeJVNwzZJb25_f6bS-LAI',
    appId: '1:71145577143:ios:4885e5973f136a64774b32',
    messagingSenderId: '71145577143',
    projectId: 'fiscal-81d65',
    storageBucket: 'fiscal-81d65.appspot.com',
    iosClientId: '71145577143-i2j8rukcus96uv60v0536tpa597s87k1.apps.googleusercontent.com',
    iosBundleId: 'com.example.fiscal',
  );
}