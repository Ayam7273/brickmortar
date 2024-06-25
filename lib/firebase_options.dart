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
    apiKey: 'AIzaSyD8ReT_nVtzJQo4wlBfJJ5LNVboU6UGRoA',
    appId: '1:78417678101:web:aeac648837eb5463d5e31c',
    messagingSenderId: '78417678101',
    projectId: 'brickmortar-4ab79',
    authDomain: 'brickmortar-4ab79.firebaseapp.com',
    storageBucket: 'brickmortar-4ab79.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaMRvI05RtudxsmhNp7QK5OeUMoxmW98c',
    appId: '1:78417678101:android:23d6333f3a3981c6d5e31c',
    messagingSenderId: '78417678101',
    projectId: 'brickmortar-4ab79',
    storageBucket: 'brickmortar-4ab79.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdd7elFzxiDdVZdTua3k1gSdFE-msrKXo',
    appId: '1:78417678101:ios:130b61c3c84b5116d5e31c',
    messagingSenderId: '78417678101',
    projectId: 'brickmortar-4ab79',
    storageBucket: 'brickmortar-4ab79.appspot.com',
    iosBundleId: 'com.example.brickmortar',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAdd7elFzxiDdVZdTua3k1gSdFE-msrKXo',
    appId: '1:78417678101:ios:130b61c3c84b5116d5e31c',
    messagingSenderId: '78417678101',
    projectId: 'brickmortar-4ab79',
    storageBucket: 'brickmortar-4ab79.appspot.com',
    iosBundleId: 'com.example.brickmortar',
  );

}