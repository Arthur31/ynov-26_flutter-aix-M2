import 'package:aix_1/TP-5_riverpod/providers/counterProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              int count = ref.watch(counterNotifierProvider);
              return Text(
                count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
        ),
        appBar: AppBar(
          title: Text("Count"),
          actions: [
            Consumer(
              builder: (context, ref, child) {
                int count = ref.watch(counterNotifierProvider);
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
        floatingActionButton: FABs(),
      ),
    );
  }
}

class FABs extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(counterNotifierProvider.notifier);
    return Column(
      mainAxisSize: .min,
      spacing: 10,
      children: [
        FloatingActionButton(
          onPressed: () => notifier.increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => notifier.reset(),
          tooltip: 'Reset',
          child: const Icon(Icons.exposure_zero),
        ),
        FloatingActionButton(
          onPressed: () => notifier.decrement(),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
