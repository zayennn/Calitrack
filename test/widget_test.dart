import 'package:flutter_test/flutter_test.dart';

import 'package:cali_track/main.dart';

void main() {
  testWidgets('App builds successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const CaliTrackApp());
    expect(find.text('CaliTrack'), findsNothing);
  });
}
