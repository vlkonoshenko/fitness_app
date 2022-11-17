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
    apiKey: 'AIzaSyAdTseoxdPWQQ0sFu-4-40bhVmoFSo25hg',
    appId: '1:448327838256:web:b082cda09e6aa3830a5bf5',
    messagingSenderId: '448327838256',
    projectId: 'fitness-1c4ae',
    authDomain: 'fitness-1c4ae.firebaseapp.com',
    storageBucket: 'fitness-1c4ae.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKKfzBdj_rT-ohOqNxbWDU3TmDdeeJlAk',
    appId: '1:448327838256:android:d39372c910ab3e3f0a5bf5',
    messagingSenderId: '448327838256',
    projectId: 'fitness-1c4ae',
    storageBucket: 'fitness-1c4ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUTb1OEyLg9Bbafs8ZKGZk--IW3VcHQUI',
    appId: '1:448327838256:ios:c27768378f03e8150a5bf5',
    messagingSenderId: '448327838256',
    projectId: 'fitness-1c4ae',
    storageBucket: 'fitness-1c4ae.appspot.com',
    iosClientId: '448327838256-0p23808m32ictkkbc742oq8pdplkf92h.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitnessApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUTb1OEyLg9Bbafs8ZKGZk--IW3VcHQUI',
    appId: '1:448327838256:ios:c27768378f03e8150a5bf5',
    messagingSenderId: '448327838256',
    projectId: 'fitness-1c4ae',
    storageBucket: 'fitness-1c4ae.appspot.com',
    iosClientId: '448327838256-0p23808m32ictkkbc742oq8pdplkf92h.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitnessApp',
  );
}

