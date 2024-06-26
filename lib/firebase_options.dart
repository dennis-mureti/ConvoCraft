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
    apiKey: 'AIzaSyBn--g4TLlFndUv3PXQotHm4rFCDIu6KTg',
    appId: '1:1013711565215:web:faefd9263df281a3ad8daa',
    messagingSenderId: '1013711565215',
    projectId: 'convocraft-e14c7',
    authDomain: 'convocraft-e14c7.firebaseapp.com',
    storageBucket: 'convocraft-e14c7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlugpzBZ-ISmbMjeRVUFKDf1LyelRT-r0',
    appId: '1:1013711565215:android:9c056818c9d40fc1ad8daa',
    messagingSenderId: '1013711565215',
    projectId: 'convocraft-e14c7',
    storageBucket: 'convocraft-e14c7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCP7uCBuAgaOExSeRN5FrI_kqYlkzBW4ck',
    appId: '1:1013711565215:ios:50c556f7a5b6ff80ad8daa',
    messagingSenderId: '1013711565215',
    projectId: 'convocraft-e14c7',
    storageBucket: 'convocraft-e14c7.appspot.com',
    iosBundleId: 'com.example.convocraft',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCP7uCBuAgaOExSeRN5FrI_kqYlkzBW4ck',
    appId: '1:1013711565215:ios:10d593fa24ce2d18ad8daa',
    messagingSenderId: '1013711565215',
    projectId: 'convocraft-e14c7',
    storageBucket: 'convocraft-e14c7.appspot.com',
    iosBundleId: 'com.example.convocraft.RunnerTests',
  );
}
