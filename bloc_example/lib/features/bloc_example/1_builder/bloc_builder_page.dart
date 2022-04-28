import 'package:bloc_example/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderPage extends StatelessWidget {
  const BlocBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocBuilder'),
      ),
      body: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (context, state) {
          if (state is ExampleStateData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.names.length,
              itemBuilder: (context, index) {
                final name = state.names[index];
                return ListTile(
                  title: Text(name),
                );
              },
            );
          }

          return const Text('Sem dados');
        },
      ),
    );
  }
}
