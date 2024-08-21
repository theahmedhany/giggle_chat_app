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
    apiKey: 'AIzaSyA8qLRN3umSR9P3S_XVvjUzbnIoivuXKEQ',
    appId: '1:90671918239:web:2996c46ba9916d7f0246aa',
    messagingSenderId: '90671918239',
    projectId: 'giggle-chat-app-a7ee2',
    authDomain: 'giggle-chat-app-a7ee2.firebaseapp.com',
    storageBucket: 'giggle-chat-app-a7ee2.appspot.com',
    measurementId: 'G-6R2TM7X83N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDM6SomkjfOSyiJiI9KafN1etyiNQO9ZpE',
    appId: '1:90671918239:android:d444bb6da14155410246aa',
    messagingSenderId: '90671918239',
    projectId: 'giggle-chat-app-a7ee2',
    storageBucket: 'giggle-chat-app-a7ee2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJ2_2k-N23621SCm58M9T9e2M44MWKxw4',
    appId: '1:90671918239:ios:afec300a007cc0ff0246aa',
    messagingSenderId: '90671918239',
    projectId: 'giggle-chat-app-a7ee2',
    storageBucket: 'giggle-chat-app-a7ee2.appspot.com',
    iosBundleId: 'com.example.giggleChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJ2_2k-N23621SCm58M9T9e2M44MWKxw4',
    appId: '1:90671918239:ios:afec300a007cc0ff0246aa',
    messagingSenderId: '90671918239',
    projectId: 'giggle-chat-app-a7ee2',
    storageBucket: 'giggle-chat-app-a7ee2.appspot.com',
    iosBundleId: 'com.example.giggleChatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA8qLRN3umSR9P3S_XVvjUzbnIoivuXKEQ',
    appId: '1:90671918239:web:70e4344583ced0c20246aa',
    messagingSenderId: '90671918239',
    projectId: 'giggle-chat-app-a7ee2',
    authDomain: 'giggle-chat-app-a7ee2.firebaseapp.com',
    storageBucket: 'giggle-chat-app-a7ee2.appspot.com',
    measurementId: 'G-R9EPN6MXPK',
  );
}
