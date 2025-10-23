// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_flutter/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    // Set a larger screen size for testing
    await tester.binding.setSurfaceSize(const Size(1200, 800));

    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    // Verify that our app builds and shows expected content
    expect(find.text('Max Kovalev'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('1 of 4'), findsOneWidget);

    // Reset surface size
    await tester.binding.setSurfaceSize(null);
  });
}
