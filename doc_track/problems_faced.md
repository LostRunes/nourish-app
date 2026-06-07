Launching lib\main.dart on V2351 in debug mode...
Your project is configured with Android NDK 27.0.12077973, but the following plugin(s) depend on a different Android NDK version:
- jni requires Android NDK 28.2.13676358
Fix this issue by using the highest Android NDK version (they are backward compatible).
Add the following to C:\Users\KIIT\OneDrive\Desktop\nourish-app\android\app\build.gradle.kts:

    android {
        ndkVersion = "28.2.13676358"
        ...
    }

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:checkDebugAarMetadata'.
> A failure occurred while executing com.android.build.gradle.internal.tasks.CheckAarMetadataWorkAction
   > 5 issues were found when checking AAR metadata:

       1.  Dependency 'androidx.activity:activity-ktx:1.12.4' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

       2.  Dependency 'androidx.activity:activity:1.12.4' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

       3.  Dependency 'androidx.core:core-ktx:1.18.0' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

       4.  Dependency 'androidx.core:core:1.18.0' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

       5.  Dependency 'androidx.navigationevent:navigationevent-android:1.0.2' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.

BUILD FAILED in 19s
Error: Gradle task assembleDebug failed with exit code 1

Launching lib\main.dart on V2351 in debug mode...

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:checkDebugAarMetadata'.
> A failure occurred while executing com.android.build.gradle.internal.tasks.CheckAarMetadataWorkAction
   > 5 issues were found when checking AAR metadata:

       1.  Dependency 'androidx.activity:activity-ktx:1.12.4' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

       2.  Dependency 'androidx.activity:activity:1.12.4' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

       3.  Dependency 'androidx.core:core-ktx:1.18.0' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

       4.  Dependency 'androidx.core:core:1.18.0' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

       5.  Dependency 'androidx.navigationevent:navigationevent-android:1.0.2' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.3.

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.

BUILD FAILED in 8s
Error: Gradle task assembleDebug failed with exit code 1

Exited (1).