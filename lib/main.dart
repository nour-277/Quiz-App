import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Value:', style: TextStyle(fontSize: 24)),

            const SizedBox(height: 20),

            BlocBuilder<CounterCubit, int>(
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Text('Increment'),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Text('Decrement'),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().reset();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
