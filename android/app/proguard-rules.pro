# Keep Flutter classes
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.** { *; }

# Keep all public classes and methods in your app
-keep class com.suja.hims.** { *; }
-keep class com.suja.hims.MainActivity { *; }


# Keep Firebase classes if you're using Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Keep your Firebase Messaging Service
-keep class com.suja.hims.careaxes_patient.MyFirebaseMessagingService.**{*;}
# Keep classes related to video calls (replace with actual package names if needed)
-keep class com.suja.hims.** { *; }
