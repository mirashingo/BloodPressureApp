import 'package:blood_pressure_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows app shell title', (WidgetTester tester) async {
    await tester.pumpWidget(const BloodPressureApp());

    expect(find.text('Blood Pressure App'), findsOneWidget);
  });
}
