import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

FirebaseOptions firebaseOptions = Platform.isAndroid ?
  const FirebaseOptions(
      apiKey: 'AIzaSyADKMxDkm8tEsP_ru2g6-lGXflnJ8CeXP8',
      appId: "1:1091211711972:android:809d17f2c19f3e1a5723f1",
      messagingSenderId: "1091211711972",
      projectId: "rapid-project-b0453") :
  const FirebaseOptions(
      apiKey: 'AIzaSyADKMxDkm8tEsP_ru2g6-lGXflnJ8CeXP8',
      appId: "1:1091211711972:android:809d17f2c19f3e1a5723f1",
      messagingSenderId: "1091211711972",
      projectId: "rapid-project-b0453");
