import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_app/core/utils.dart';

import 'package:music_app/main.dart' as app;
import 'package:music_app/presentation/widgets/appbar_search_button.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Home screen integration tests', () {
    testWidgets('Test empty home screen',
            (WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle();

          expect(find.text(AppConst.kMaterialAppTitle), findsOneWidget);
          expect(find.byType(AppbarSearchButton), findsOneWidget);
          expect(find.byType(AppBar), findsOneWidget);
        });
  });
}