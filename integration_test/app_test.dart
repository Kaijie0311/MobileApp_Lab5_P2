import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_five/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Test', () {
    testWidgets('Activation to OTP Flow', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Verify the Activation page is rendered
      expect(find.text('Welcome !'), findsOneWidget);
      expect(find.text('Enter your mobile number to activate your account.'),
          findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);

      // Enter phone number into TextField
      await tester.enterText(find.byType(TextField), '123456789');

      // Ensure the Checkbox is visible and scroll into view if necessary
      final checkboxFinder = find.byType(Checkbox);
      await tester.ensureVisible(checkboxFinder);

      // Tap the Checkbox to accept terms and conditions
      await tester.tap(checkboxFinder);
      await tester.pump();

      // Verify if Checkbox is checked
      expect(tester.widget<Checkbox>(checkboxFinder).value, isTrue);

      // Ensure the ElevatedButton is visible and enabled
      final elevatedButtonFinder = find.byType(ElevatedButton);
      await tester.ensureVisible(elevatedButtonFinder);
      expect(
          tester.widget<ElevatedButton>(elevatedButtonFinder).enabled, isTrue);

      // Tap the ElevatedButton to navigate to the OTP page
      await tester.tap(elevatedButtonFinder);
      await tester.pumpAndSettle();

      // Verify the OTP page is rendered
      expect(find.text('Enter the activation code you received via SMS.'),
          findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      // Enter OTP into TextField
      await tester.enterText(find.byType(TextField), '123456');
    });
  });
}
