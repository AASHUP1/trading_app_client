import 'package:flutter_test/flutter_test.dart';
import 'package:bold_trading_app/app.dart';

void main() {
  testWidgets('BOLD App initial launch smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BoldApp());
    expect(find.text('BOLD'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
