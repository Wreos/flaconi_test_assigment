import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/main.dart' as app;
import 'package:music_app/presentation/widgets/album_widget.dart';
import 'package:music_app/presentation/widgets/appbar_search_button.dart';

void main() {
  const artistName = "Rihanna";

  setUpAll(() {
    app.main();
  });

  group('Search integration tests', () {
    testWidgets('Verify search results are presented according user request',
            (WidgetTester tester) async {
          await tester.pumpAndSettle();
          final searchButton = find.byType(AppbarSearchButton);

          expect(searchButton, findsOneWidget);

          await tester.tap(searchButton);
          await tester.pumpAndSettle();

          final searchInput = find.byType(EditableText);
          expect(searchInput, findsOneWidget);

          await tester.enterText(searchInput, artistName);
          await tester.pumpAndSettle();
          await tester.tap(searchButton);
          await tester.pumpAndSettle();

          // Check that search results cards is being displayed
          expect(find.widgetWithText(Card, artistName), findsWidgets);
        });

    testWidgets('Adding album to dashboard from top album list',
            (WidgetTester tester) async {
          await tester.pumpAndSettle();
          final searchButton = find.byType(AppbarSearchButton);

          expect(searchButton, findsOneWidget);

          await tester.tap(searchButton);
          await tester.pumpAndSettle();

          final searchInput = find.byType(EditableText);
          expect(searchInput, findsOneWidget);

          await tester.enterText(searchInput, artistName);
          await tester.pumpAndSettle();
          await tester.tap(searchButton);
          await tester.pumpAndSettle();
          await tester.tap(find.widgetWithText(Card, artistName));
          await tester.pumpAndSettle();

          // Check that top albums page is displayed for specific artist
          expect(find.text("$artistName Top Albums"), findsOneWidget);

          await tester.tap(find.byKey(Key("favoriteButton")).first);
          await tester.pumpAndSettle();
          await tester.tap(find.byType(BackButton));
          await tester.pumpAndSettle();

          // Check that search result is not deleted when do back navigation
          expect(find.widgetWithText(Card, artistName), findsWidgets);

          await tester.tap(find.byType(BackButton));
          await tester.pumpAndSettle();

          // Check that album has added to dashboard
          expect(find.byType(Card), findsOneWidget);
        });

    testWidgets('Сheck album page opening from search',
            (WidgetTester tester) async {
          await tester.pumpAndSettle();
          final searchButton = find.byType(AppbarSearchButton);

          expect(searchButton, findsOneWidget);

          await tester.tap(searchButton);
          await tester.pumpAndSettle();

          final searchInput = find.byType(EditableText);
          expect(searchInput, findsOneWidget);

          await tester.enterText(searchInput, artistName);
          await tester.pumpAndSettle();
          await tester.tap(searchButton);
          await tester.pumpAndSettle();
          await tester.tap(find.widgetWithText(Card, artistName));
          await tester.pumpAndSettle();
          await tester.tap(find.byType(AlbumsWidget).first);
          await tester.pumpAndSettle();

          // Check that album details are displayed
          expect(find.text(AppConst.kMaterialAppTitle), findsOneWidget);
          expect(find.byKey(Key("albumDetailsImage")), findsOneWidget);
          expect(find.text("Artist"), findsOneWidget);
          expect(find.text("Album"), findsOneWidget);
        });
  });
}
