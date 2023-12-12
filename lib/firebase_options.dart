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
    apiKey: 'AIzaSyBz-p4CKNH655r_L_rqQJ7DIGWYR42xCn4',
    appId: '1:1088198301540:web:29c3eb4410b0dacc42cc71',
    messagingSenderId: '1088198301540',
    projectId: 'flutterblog-f8bf2',
    authDomain: 'flutterblog-f8bf2.firebaseapp.com',
    databaseURL: 'https://flutterblog-f8bf2-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutterblog-f8bf2.appspot.com',
    measurementId: 'G-14XYVDGDCZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbJ_RuRH1IQwpgiBO8hMPqMuUT9BYbKeg',
    appId: '1:1088198301540:android:ca7faf393e1c962b42cc71',
    messagingSenderId: '1088198301540',
    projectId: 'flutterblog-f8bf2',
    databaseURL: 'https://flutterblog-f8bf2-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutterblog-f8bf2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDt9fS9963hvBn2WyeTlE0XVU4bXfyYtyM',
    appId: '1:1088198301540:ios:ab2ed9a87473000042cc71',
    messagingSenderId: '1088198301540',
    projectId: 'flutterblog-f8bf2',
    databaseURL: 'https://flutterblog-f8bf2-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutterblog-f8bf2.appspot.com',
    androidClientId: '1088198301540-34o8ti6m1m8bms9df67krkj6iu3i3th6.apps.googleusercontent.com',
    iosClientId: '1088198301540-qvquov9c42t8605ub1fpr2kemvhku039.apps.googleusercontent.com',
    iosBundleId: 'com.example.blogApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDt9fS9963hvBn2WyeTlE0XVU4bXfyYtyM',
    appId: '1:1088198301540:ios:7a3cf5d2ab390ff742cc71',
    messagingSenderId: '1088198301540',
    projectId: 'flutterblog-f8bf2',
    databaseURL: 'https://flutterblog-f8bf2-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'flutterblog-f8bf2.appspot.com',
    androidClientId: '1088198301540-34o8ti6m1m8bms9df67krkj6iu3i3th6.apps.googleusercontent.com',
    iosClientId: '1088198301540-g7g8dok1vmcp6kpar2la8v79gfd4qog8.apps.googleusercontent.com',
    iosBundleId: 'com.example.blogApp.RunnerTests',
  );
}
