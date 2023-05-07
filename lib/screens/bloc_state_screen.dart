import 'package:ezy_tespen_learn/bloc/counter_bloc.dart';
import 'package:ezy_tespen_learn/screens/another_block_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocStateScreen extends StatelessWidget {
  const BlocStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _content(),
      ),
    );
  }

  Widget _content() {
    return Builder(builder: (context) {
      return Row(
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(MinusCounterEvent());
              },
              child: const Text("-")),
          const SizedBox(
            width: 24,
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text("${state.counter}");
            },
          ),
          const SizedBox(
            width: 24,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(PlusCounterEvent());
              },
              child: const Text("+")),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AnotherBlockScreen(),
                ));
              },
              child: Text("Pindah"))
        ],
      );
    });
  }
}
