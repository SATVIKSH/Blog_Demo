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
    apiKey: 'AIzaSyBW1KP0B5fHo6jCA_XBPHwQ4E6wl8HwS08',
    appId: '1:1020283915333:web:025d3b67be912a6dc4a72c',
    messagingSenderId: '1020283915333',
    projectId: 'blog-c54a2',
    authDomain: 'blog-c54a2.firebaseapp.com',
    storageBucket: 'blog-c54a2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6Lqx16zlyVPgmgRdxvZkOC4kERhB5e6E',
    appId: '1:1020283915333:android:2d44ffa1b4b0a867c4a72c',
    messagingSenderId: '1020283915333',
    projectId: 'blog-c54a2',
    storageBucket: 'blog-c54a2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZrIMXEPPt3ibnxpDM70hnVxvHUXTDl-k',
    appId: '1:1020283915333:ios:19ed345e4f29114ac4a72c',
    messagingSenderId: '1020283915333',
    projectId: 'blog-c54a2',
    storageBucket: 'blog-c54a2.appspot.com',
    iosBundleId: 'com.example.blog',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZrIMXEPPt3ibnxpDM70hnVxvHUXTDl-k',
    appId: '1:1020283915333:ios:14a15417d382ae45c4a72c',
    messagingSenderId: '1020283915333',
    projectId: 'blog-c54a2',
    storageBucket: 'blog-c54a2.appspot.com',
    iosBundleId: 'com.example.blog.RunnerTests',
  );
}
