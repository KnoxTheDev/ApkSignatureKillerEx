# Strip all R classes
-assumenosideeffects class **.R { *; }
-assumenosideeffects class **.R$* { *; }

# Remove synthetic compiler artifacts
-assumenosideeffects class **.ExternalSyntheticApiModelOutline* { *; }

# Remove test/debug code if not needed
-assumenosideeffects class bin.mt.test.** { *; }

# Keep main app logic
-keep class bin.mt.signature.** { *; }

# Keep native method references
-keepclasseswithmembernames class * {
    native <methods>;
}
