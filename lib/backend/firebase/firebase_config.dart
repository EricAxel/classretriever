import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA3V1Oou3KdEEHOLhR4WGzz8U1Xxjq2OVs",
            authDomain: "class-retriever-42b99.firebaseapp.com",
            projectId: "class-retriever-42b99",
            storageBucket: "class-retriever-42b99.firebasestorage.app",
            messagingSenderId: "633677209986",
            appId: "1:633677209986:web:653f25fb17a0c6c84cef9b",
            measurementId: "G-FSX8LSXFL3"));
  } else {
    await Firebase.initializeApp();
  }
}
