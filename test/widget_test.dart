import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_playground/main.dart';

void main() {
  testWidgets('Practice screen shows lesson and selectable options', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(430, 932));
    await tester.pumpWidget(const MyApp());

    expect(find.text('PRACTICE'), findsOneWidget);
    expect(find.text('Want to join the game? ⚽'), findsOneWidget);
    expect(find.text('Ask "Can I play?" 😊'), findsOneWidget);
    expect(find.text('Watch first 👀'), findsOneWidget);

    await tester.tap(find.text('Watch first 👀'));
    await tester.pump();

    expect(find.text('Try it!'), findsOneWidget);

    addTearDown(() => tester.binding.setSurfaceSize(null));
  });
}
