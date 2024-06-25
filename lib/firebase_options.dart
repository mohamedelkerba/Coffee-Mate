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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDt1ritnu7wlQnG3Bwh_1R-6DilnANsY1M',
    appId: '1:120065629637:web:866b3b29fe9a1e0e85ffac',
    messagingSenderId: '120065629637',
    projectId: 'fire-setup-453cf',
    authDomain: 'fire-setup-453cf.firebaseapp.com',
    storageBucket: 'fire-setup-453cf.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDF5EpwwzNGg_JQe125pVxB5gAQaFy1VVI',
    appId: '1:120065629637:android:0083e6d435fd813485ffac',
    messagingSenderId: '120065629637',
    projectId: 'fire-setup-453cf',
    storageBucket: 'fire-setup-453cf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUxUQE7ShKwBjxS5M8YwGTBJciXHMl0IQ',
    appId: '1:120065629637:ios:a8089997a8e7da3f85ffac',
    messagingSenderId: '120065629637',
    projectId: 'fire-setup-453cf',
    storageBucket: 'fire-setup-453cf.appspot.com',
    iosBundleId: 'com.example.myproject',
  );
}
