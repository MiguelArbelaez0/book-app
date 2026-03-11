import 'package:flutter_test/flutter_test.dart';

import 'package:book_app/main.dart';

void main() {
  testWidgets('renders modern catalog and filters by search', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Book App 2026'), findsOneWidget);
    expect(find.text('Atomic Habits'), findsOneWidget);

    await tester.enterText(
      find.byType(EditableText),
      'pragmatic',
    );
    await tester.pumpAndSettle();

    expect(find.text('The Pragmatic Programmer'), findsOneWidget);
    expect(find.text('Atomic Habits'), findsNothing);
  });
}
