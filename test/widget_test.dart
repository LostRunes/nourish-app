import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nourish_app/main.dart';
import 'package:nourish_app/providers/shared_preferences_provider.dart';
import 'package:nourish_app/router.dart';

void main() {
  testWidgets('App landing check', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = SharedPreferencesProvider();
    await prefs.loadSettings();

    final appRouter = createRouter(true);

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(prefs: prefs, router: appRouter));

    // Simple test validation
    expect(find.byType(MyApp), findsOneWidget);
  });
}
