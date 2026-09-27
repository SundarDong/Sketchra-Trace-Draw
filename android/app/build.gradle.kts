import java.util.Properties
import java.io.FileInputStream
plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after  the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")

    // Apply Google Services plugin for Firebase
    id("com.google.gms.google-services")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
val hasReleaseSigning = keystorePropertiesFile.exists() && run {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
    listOf("keyAlias", "keyPassword", "storeFile", "storePassword").all { keystoreProperties[it] != null }
}

android {
    namespace = "com.sketchra.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // Your app ID
        applicationId = "com.sketchra.app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }
    signingConfigs {
        if (hasReleaseSigning) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now,
            // so `flutter run --release` works.
            signingConfig = signingConfigs.findByName("release") ?: signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Firebase BoM to manage versions automatically
    implementation(platform("com.google.firebase:firebase-bom:34.5.0"))

    // Firebase Analytics
    implementation("com.google.firebase:firebase-analytics")

    // Add other Firebase SDKs if needed, for example:
    // implementation("com.google.firebase:firebase-firestore")
}
