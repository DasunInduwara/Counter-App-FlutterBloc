import 'package:counter_app_with_bloc/bloc/bloc_imports.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is CounterIncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Succesfully Increased")));
              } else if (state is CounterDecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Succesfully Decreased")));
              }
            },
            builder: (context, state) {
              return Text("Counter Value: ${state.counterValue}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20));
            },
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterDecrementEvent()),
                child: const Text("- Decreese")),
            ElevatedButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterIncrementEvent()),
                child: const Text("+ Increese"))
          ])
        ],
      ),
    ));
  }
}
