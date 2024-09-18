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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBv7efSO2jVQgQ64sO0hAqyJn-A0x1Db6M',
    appId: '1:418029376310:android:1a313258869a318edf9997',
    messagingSenderId: '418029376310',
    projectId: 'careaxes-24ee0',
    databaseURL: 'https://careaxes-24ee0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'careaxes-24ee0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDA4tqTDPEKXd2itDAtLnJXA1hf1iczxxk',
    appId: '1:418029376310:ios:fa062b3ac35746b0df9997',
    messagingSenderId: '418029376310',
    projectId: 'careaxes-24ee0',
    databaseURL: 'https://careaxes-24ee0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'careaxes-24ee0.appspot.com',
    androidClientId: '418029376310-kqstc10k43lm3trp910bm456fs4c89tr.apps.googleusercontent.com',
    iosClientId: '418029376310-a2ngga1a96scqel4hko54lnvd27bftmf.apps.googleusercontent.com',
    iosBundleId: 'com.suja.hims.careaxesPatient',
  );
}
