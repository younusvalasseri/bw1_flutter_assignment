import java.util.Properties
import java.io.FileInputStream

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("../key.properties") // path to key.properties at project root

if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
} else {
    throw GradleException("Missing key.properties file at project root.")
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.bw1_flutter_assignment"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.example.bw1_flutter_assignment"
        minSdk = 21
        targetSdk = 36
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    signingConfigs {
        create("release") {
            val storeFilePath = keystoreProperties["storeFile"] as String?
            val storePassword = keystoreProperties["storePassword"] as String?
            val keyAlias = keystoreProperties["keyAlias"] as String?
            val keyPassword = keystoreProperties["keyPassword"] as String?

            if (storeFilePath != null && storePassword != null && keyAlias != null && keyPassword != null) {
                storeFile = rootProject.file("../$storeFilePath")
                this.storePassword = storePassword
                this.keyAlias = keyAlias
                this.keyPassword = keyPassword
            } else {
                throw GradleException("Missing keystore properties. Please check your key.properties file.")
            }
        }
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            isShrinkResources = false
            signingConfig = signingConfigs.getByName("release")
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

flutter {
    source = "../.."
}
