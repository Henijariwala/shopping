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
    apiKey: 'AIzaSyC3RDJVuMq4urFh8k9FyrDflR4uqpiUhq0',
    appId: '1:341496274740:web:83b1399ed5fb8930500f61',
    messagingSenderId: '341496274740',
    projectId: 'shopping-fd386',
    authDomain: 'shopping-fd386.firebaseapp.com',
    storageBucket: 'shopping-fd386.appspot.com',
    measurementId: 'G-YPHWM4R7VY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBG0zsMfJj830osMsvmC1P78jlHdlT7EL4',
    appId: '1:341496274740:android:e55da564898f51a8500f61',
    messagingSenderId: '341496274740',
    projectId: 'shopping-fd386',
    storageBucket: 'shopping-fd386.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3htXMHlUHrrtAeH4wzf8vQdEo3YG_NlI',
    appId: '1:341496274740:ios:87569e89c519f3cf500f61',
    messagingSenderId: '341496274740',
    projectId: 'shopping-fd386',
    storageBucket: 'shopping-fd386.appspot.com',
    iosBundleId: 'com.example.shopping',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3htXMHlUHrrtAeH4wzf8vQdEo3YG_NlI',
    appId: '1:341496274740:ios:87569e89c519f3cf500f61',
    messagingSenderId: '341496274740',
    projectId: 'shopping-fd386',
    storageBucket: 'shopping-fd386.appspot.com',
    iosBundleId: 'com.example.shopping',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3RDJVuMq4urFh8k9FyrDflR4uqpiUhq0',
    appId: '1:341496274740:web:d8cb9e0e70be66f7500f61',
    messagingSenderId: '341496274740',
    projectId: 'shopping-fd386',
    authDomain: 'shopping-fd386.firebaseapp.com',
    storageBucket: 'shopping-fd386.appspot.com',
    measurementId: 'G-RGWZWF0NXF',
  );
}
