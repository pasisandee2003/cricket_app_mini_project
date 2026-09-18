import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mini_cricket/main.dart'; // Make sure this matches your project name

void main() {
  testWidgets('Mini Cricket App Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MiniCricketApp());

    // Verify that our game starts with 0 runs and 6 balls.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);

    // Tap the 'Bat' button and trigger a frame.
    await tester.tap(find.text('Bat'));
    await tester.pump();

    // Verify that our ball count has decreased to 5.
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsNothing);
  });
}