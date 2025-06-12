Changes you need for authentication firebase -


1- Create Project in firebase console and dowload google_service.json file and located in android/app.
2-  in android/app - build.gradle.kts add -
 -  plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
 }

3- In AndroidManifest file add in application - 

 <meta-data
        android:name="com.google.firebase.messaging.default_notification_channel_id"
        android:value="default_channel_id" />

4 - In android build.gradle.kts add - 

    dependencies {
        classpath("com.android.tools.build:gradle:8.2.0") // or your current version
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.9.24") // match your Kotlin version
        classpath("com.google.gms:google-services:4.4.2") // ✅ Firebase plugin
    }
