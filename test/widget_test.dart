import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:blood_pressure_app/app/app.dart';
import 'package:blood_pressure_app/app/router/route_paths.dart';

final smokeMessageProvider = Provider<String>((ref) => 'default');

void main() {
  testWidgets('renders app shell through GoRouter', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: BloodPressureApp()));
    await tester.pump();

    expect(find.text('Blood Pressure App'), findsOneWidget);

    final context = tester.element(find.text('Blood Pressure App'));
    final router = GoRouter.of(context);

    expect(
      router.routeInformationProvider.value.uri.path,
      AppRoutePaths.appShell,
    );
  });

  testWidgets('overrides a provider inside ProviderScope', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [smokeMessageProvider.overrideWithValue('overridden')],
        child: const MaterialApp(home: Scaffold(body: _SmokeConsumer())),
      ),
    );

    expect(find.text('overridden'), findsOneWidget);
    expect(find.text('default'), findsNothing);
  });
}

class _SmokeConsumer extends ConsumerWidget {
  const _SmokeConsumer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(ref.watch(smokeMessageProvider));
  }
}
