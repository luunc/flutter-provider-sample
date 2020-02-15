import 'package:dxdart/injection.dart';
import 'package:dxdart/screens/home/change_button/change_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../make_testable_widget.dart';

void main() async {
  testWidgets("#1 testing ChangeButton when loading is false",
      (WidgetTester tester) async {
    await configureInjection();

    final widget = makeTestableWidget(ChangeButton(false));

    await tester.pumpWidget(widget);

    Finder changeButton = find.byKey(Key('screens_home_floatingActionButton'));
    expect(changeButton, findsOneWidget);

    Finder loadingWidget = find.byType(CircularProgressIndicator);
    expect(loadingWidget, findsNothing);

    Finder changeIcon = find.byIcon(Icons.compare_arrows);
    expect(changeIcon, findsOneWidget);
  });

  testWidgets("#2 testing ChangeButton when loading is true",
      (WidgetTester tester) async {
    getIt.reset();

    await configureInjection();

    final widget = makeTestableWidget(ChangeButton(true));

    await tester.pumpWidget(widget);

    Finder changeButton = find.byKey(Key('screens_home_floatingActionButton'));
    expect(changeButton, findsOneWidget);

    Finder loadingWidget = find.byType(CircularProgressIndicator);
    expect(loadingWidget, findsOneWidget);

    Finder changeIcon = find.byIcon(Icons.compare_arrows);
    expect(changeIcon, findsNothing);
  });
}
