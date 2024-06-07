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

      // Tap the Checkbox to accept terms and conditions
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      // Verify if Checkbox is checked
      expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);

      // Verify if the ElevatedButton is enabled after entering a phone number and checking the checkbox
      expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
          isTrue);

      // Tap the ElevatedButton to navigate to the OTP page
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify the OTP page is rendered
      expect(find.text('Enter the activation code you received via SMS.'),
          findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      // Enter OTP into TextField
      await tester.enterText(find.byType(TextField), '123456');

      // Tap the Activate button to navigate to the Factory1Dashboard
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify the Factory1Dashboard is rendered
      // Update the following line to match the actual text or widget in your Factory1Dashboard
      expect(find.text('Factory 1'), findsOneWidget);
    });
  });
}
