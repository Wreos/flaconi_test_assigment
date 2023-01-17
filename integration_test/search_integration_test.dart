import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/generated/app_text.dart';

import 'package:music_app/main.dart' as app;
import 'package:music_app/presentation/widgets/appbar_search_button.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Search integration tests', () {
    testWidgets('Search by artist name',
            (WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle();
          final searchButton = find.byType(AppbarSearchButton);

          expect(searchButton, findsOneWidget);

          await tester.tap(searchButton);
          await tester.pumpAndSettle();

          final searchInput = find.byType(EditableText);
          expect(searchInput, findsOneWidget);

          await tester.enterText(searchInput, "312312312");
          await Future.delayed(const Duration(seconds: 10));

          expect(find.byType(AppBar), findsOneWidget);
        });
  });
}