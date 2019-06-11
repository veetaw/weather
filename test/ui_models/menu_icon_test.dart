import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather/ui_models/menu_icon.dart';

main() {
  testWidgets(
    "check what the widget does when parent is smaller than icon size",
    (tester) async {
      final Key _iconKey = Key('icon');
      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 10,
            height: 10,
            child: MenuIcon(
              key: _iconKey,
              length: 15,
              secondLineLength: 150,
              color: Colors.red,
            ),
          ),
        ),
      );

      // the widget should not throw any exception and should be visible in the tree
      expect(find.byKey(_iconKey), findsOneWidget);
    },
  );
}
