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
    apiKey: 'AIzaSyCoyrK6vriJokgEKKhISMgMHoE-DEyWtNA',
    appId: '1:942860456892:web:1a8f07e870c915771d51b9',
    messagingSenderId: '942860456892',
    projectId: 'deciml-bly',
    authDomain: 'deciml-bly.firebaseapp.com',
    storageBucket: 'deciml-bly.appspot.com',
    measurementId: 'G-WJK4Q87RBR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPKmImOT18z3pujtTSXhdJeBV8GoCf-xE',
    appId: '1:942860456892:android:6dcf00b2448b4a851d51b9',
    messagingSenderId: '942860456892',
    projectId: 'deciml-bly',
    storageBucket: 'deciml-bly.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAImXeO-ZnuphsIkxj9j6NX-llViKqWew',
    appId: '1:942860456892:ios:de041028480cca8a1d51b9',
    messagingSenderId: '942860456892',
    projectId: 'deciml-bly',
    storageBucket: 'deciml-bly.appspot.com',
    iosClientId:
        '942860456892-70hi4q3h6umud4v448ujm4cdipmpmkjn.apps.googleusercontent.com',
    iosBundleId: 'com.deciml.bly.decimlBly',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAImXeO-ZnuphsIkxj9j6NX-llViKqWew',
    appId: '1:942860456892:ios:6c05c27a1005aa3a1d51b9',
    messagingSenderId: '942860456892',
    projectId: 'deciml-bly',
    storageBucket: 'deciml-bly.appspot.com',
    iosClientId:
        '942860456892-ro12akprrk89i23ttbgu2itpv8tp8lhm.apps.googleusercontent.com',
    iosBundleId: 'com.deciml.bly.decimlBly.RunnerTests',
  );
}
