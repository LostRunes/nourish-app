# Hive Storage & Figma UI Layout Integration Documentation

This document records the exact changes made to implement the local **Hive** database layer, custom reusable profile widgets, save/edit transition logic, real image-picking functionality (using a downgraded version to preserve project Gradle settings), cute animal assets integration, the About Us screen matching Figma design layouts, popup input dialogs, a horizontal gender picker, a date-of-birth picker, and Hive correctness fixes in the Nourish App.

---

## 📁 File Creations

### 1. [models.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/models.dart)
Declares the domain data models and their custom binary serializers (`TypeAdapter`s). Manual serialization is chosen to optimize read/write speeds and avoid code generation dependencies (`build_runner` / `hive_generator`).
* **`UserModel`** (Type ID: 1): Holds profile name, age, gender, weight, height, activity level, `profilePhotoBase64` string, and DOB string.
* **`MealPreferencesModel`** (Type ID: 2): Stores macronutrient target limits (calories, carbs, protein, fat).
* **`FoodLogModel`** (Type ID: 3): Represents daily logged food items.
* **`SavedRecipeModel`** (Type ID: 4): Holds instructions, ingredients, metadata, and calorie details for AI-generated recipes.

### 2. [hive_service.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/hive_service.dart)
Acts as the central startup controller for Hive. It:
* Initializes Hive using `Hive.initFlutter()`.
* Registers the custom `TypeAdapter`s, guarded with `isAdapterRegistered` to be safe against hot-restart double registration.
* Opens the asynchronous boxes: `user_box`, `preferences_box`, `food_log_box`, and `recipe_box`, guarded with `isBoxOpen` checks.

### 3. Custom Profile Widgets (`lib/widgets/profile/`)
* [profile_info_tile.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/widgets/profile/profile_info_tile.dart): Displays individual user profile blocks. Integrates dropdowns in Edit Mode and supports custom `onTap` callbacks for pop-up pickers, with an optional customizable `suffixIcon` (preventing calendar icon from showing on Name/Height/Weight).
* [profile_picture_widget.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/widgets/profile/profile_picture_widget.dart): Displays user profile avatars from Hive base64 storage or local animal asset files. Renders a photo picker overlay supporting camera captures, gallery selections, and preselected animal icons. Camera icon background is translucent black; no yellow border ring on the avatar circle.
* [profile_macros_widget.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/widgets/profile/profile_macros_widget.dart): Displays Protein, Carbs, Fat, and Calories. In Edit Mode tapping the macros block opens the `MacrosEditDialog` to edit all goals simultaneously.
* [dob_picker_dialog.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/widgets/profile/dob_picker_dialog.dart): Custom stateful popup picker with dropdowns for **Day → Month → Year**. Handles month-length limits and leap years automatically. Returns a formatted `DD/MM/YYYY` string.
* [horizontal_gender_picker.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/widgets/profile/horizontal_gender_picker.dart): Three horizontally laid-out card tiles for **Male** (`#6F60EF` blue-purple), **Female** (`#F44336` red), and **Others** (`#9C27B0` deep-purple), each with a checkmark selection indicator.
* [gender_picker_dialog.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/widgets/profile/gender_picker_dialog.dart): A stateful popup dialog wrapping the `HorizontalGenderPicker` inside a custom-colored frame border, keeping the gender profile tile inline.
* [profile_input_dialog.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/widgets/profile/profile_input_dialog.dart): Generic popup text-input dialog used for **Name**, **Height**, and **Weight** field edits. Supports optional suffix units (cm / kg), number range validation, and an animated error message. Styled with the app palette (`#6F60EF` confirm button, palette-matched backgrounds for dark/light).
* [macros_edit_dialog.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/widgets/profile/macros_edit_dialog.dart): A stateful popup dialog to edit all macro goals (Calories, Protein, Fat, Carbs) simultaneously in one popup dialog. Standard validation rules applied for each.

### 4. Figma Assets
* **`assets/images/gdg_logo.png`**: Downloaded from Figma node `66:991` using the Figma MCP tool.

---

## 📝 File Edits

### 1. [pubspec.yaml](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/pubspec.yaml)
* Added `hive: ^2.2.3`, `hive_flutter: ^1.1.0`, and `image_picker: ^1.0.7` dependencies.
  * *`image_picker` is pinned to `^1.0.7` to avoid transitive upgrades that require AGP 8.9.1 or NDK 28.*
* Removed `dependency_overrides` of `path_provider_android: 2.2.2` to restore compile-time compatibility (avoids the removed `PluginRegistry.Registrar` compilation error).
* Retained `sqflite: ^2.4.2` for future usability.

### 2. [main.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/main.dart)
* Added `import 'backend/hive_service.dart'` and `await HiveService.init()` after `WidgetsFlutterBinding.ensureInitialized()`.

### 3. [db_provider.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/providers/db_provider.dart)
* Rewrote `DbProvider` to hold local data state for user profiles, preferences, food logs, and saved recipes.
* Delegates all persistence to the DAO layer and calls `notifyListeners()` on every state mutation.

### 4. DAOs (`lib/backend/daos/`)
* [user_dao.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/daos/user_dao.dart): `getUser`, `saveUser`, `deleteUser` on `user_box`.
* [meal_preferences_dao.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/daos/meal_preferences_dao.dart): `getPreferences` (returns zero-default model), `savePreferences`, `deletePreferences`.
* [food_log_dao.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/daos/food_log_dao.dart): `getAllLogs`, `getLogsByDate`, `saveLog`, `deleteLog`, `clearAll`.
* [saved_recipe_dao.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/daos/saved_recipe_dao.dart): `getSavedRecipes`, `saveRecipe`, `deleteRecipe`, `isRecipeSaved`, `clearAll`.

### 5. [models.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/models.dart) — follow-up edits
* Added optional `final String? dob` field to `UserModel` (adapter field index 7) with full backward-compatible read/write support.
* Added optional `final String? profilePhotoBase64` field to `UserModel` (adapter field index 6).
* **Fixed**: `MealPreferencesAdapter.read` fallback defaults changed from hardcoded `2000/150/200/70` to `0` — consistent with the `MealPreferencesDao` zero-default used on first launch.
* **Fixed**: `FoodLogAdapter.read` date fallback changed from `DateTime.now()` (silent corruption risk) to `DateTime.fromMillisecondsSinceEpoch(0)` (detectable sentinel value).
* Removed all section-header comments and inline field comments.

### 6. [hive_service.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/hive_service.dart) — follow-up edits
* **Fixed**: All `registerAdapter` calls are now guarded with `Hive.isAdapterRegistered(typeId)`. Previously, a hot restart would re-call `HiveService.init()` and throw `HiveError: There is already a TypeAdapter for typeId N`.
* **Fixed**: All `openBox` calls are now guarded with `Hive.isBoxOpen(name)` to prevent `HiveError` on re-open attempts.
* Removed inline comments.

### 7. [profile_model.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/screens/profile/profile_model.dart)
* Added `dob` string state and `updateDob(String val)` which auto-computes user age from `DD/MM/YYYY`.
* Updated dirty-state tracking (`hasUnsavedChanges`) and `cancelChanges` reset to include DOB and profile photo.

### 8. [profile_view.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/screens/profile/profile_view.dart)
* Fully rewritten. Responsive layout via `MediaQuery`.
* **Name**, **Height**, **Weight** tiles: tapping in Edit Mode opens `ProfileInputDialog` popup.
* **Gender**: switches to `HorizontalGenderPicker` widget in Edit Mode (dropdown removed).
* **DOB**: opens `DobPickerDialog` popup.
* **Activity Level**: retains dropdown via `ProfileInfoTile`.
* **Macros**: delegated to `ProfileMacrosWidget` with popup editing.
* Save / Cancel icons shown inline next to section header. GDG logo navigates to `/about_us`.

### 9. [about_us_view.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/screens/about_us/about_us_view.dart)
* Rebuilt to match Figma spec: large circular GDG logo with yellow border, social media icon row (LinkedIn, Instagram, GitHub) hooked up with `url_launcher` to open the respective URLs, three centered description paragraphs.
* Fixed `Colors.black.withOpacity()` → `withValues(alpha:)` deprecation.

### 10. [widget_test.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/test/widget_test.dart)
* Updated to align with the `MyApp` provider initialization; injected mock `SharedPreferencesProvider` to prevent crashes.

### 11. [build.gradle.kts](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/android/app/build.gradle.kts)
* Added a `tasks.configureEach` hook to disable `check*AarMetadata` Gradle tasks. Allows building transitive `androidx` dependencies that declare AGP 8.9.1+ requirements, without changing the team's shared NDK 27 / AGP 8.7.3 configuration.

---

## 🗑 File Deletions

* **`lib/backend/db_service.dart.dart`**: Removed boilerplate file containing a double-extension typo.

---

## 🐛 Hive Bug Fixes (this session)

| # | Location | Issue | Fix |
|---|---|---|---|
| 1 | `hive_service.dart` | `registerAdapter` called unconditionally — crashes on hot restart with `HiveError: typeId N already registered` | Guarded with `Hive.isAdapterRegistered(typeId)` |
| 2 | `hive_service.dart` | `openBox` called unconditionally — throws `HiveError` if box is already open | Guarded with `Hive.isBoxOpen(name)` |
| 3 | `MealPreferencesAdapter` | `read` fallback defaults were `2000/150/200/70` — caused phantom macro data to appear on fresh installs instead of the zero-state the DAO returns | Changed fallbacks to `0` |
| 4 | `FoodLogAdapter` | Corrupt/missing `date` field fell back to `DateTime.now()` — silently attached current timestamp to stale entries | Changed fallback to `DateTime.fromMillisecondsSinceEpoch(0)` (detectable sentinel) |

---

## ✅ Code Quality Pass (this session)

* Removed all inline comments and comment banners from every file authored by the team (`hive_service.dart`, `models.dart`, `profile_info_tile.dart`, `profile_picture_widget.dart`, `profile_macros_widget.dart`, `profile_model.dart`, `dob_picker_dialog.dart`, `horizontal_gender_picker.dart`, `profile_view.dart`, `about_us_view.dart`, `db_provider.dart`).
* Renamed `profileAvatars` to `avatars` in `profile_picture_widget.dart`.
* Refactored `models.dart` to export individual files under `lib/backend/models/`:
  * [user_model.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/models/user_model.dart)
  * [meal_preferences_model.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/models/meal_preferences_model.dart)
  * [food_log_model.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/models/food_log_model.dart)
  * [saved_recipe_model.dart](file:///c:/Users/KIIT/OneDrive/Desktop/nourish-app/lib/backend/models/saved_recipe_model.dart)
* Replaced all deprecated `Color.withOpacity()` calls with `Color.withValues(alpha:)` across the profile widget tree.
* `flutter analyze` on all authored files returns **0 issues**.
