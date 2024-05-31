import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_toast/i_toast.dart';

void main() {
  testWidgets('Toast message is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
              onPressed: () {
                IToastService.show(
                  context,
                  title: 'Title',
                  description: 'Description',
                  trailing: Container(),
                  leading: Container(),
                  toastType: ToastType.success,
                  duration: Durations.medium1,
                );
              },
              child: const Text('Show Toast'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Show Toast'));
    await tester.pump(const Duration(milliseconds: 7000));

    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    // expect(find.byWidget(trailingWidget), findsOneWidget);
  });
}
