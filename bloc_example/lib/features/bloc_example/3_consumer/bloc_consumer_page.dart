import 'package:bloc_example/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerPage extends StatelessWidget {
  const BlocConsumerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocConsumer'),
      ),
      body: Column(
        children: [
          BlocConsumer<ExampleBloc, ExampleState>(
            listener: (context, state) {
              print('Estado alterado!');
              if (state is ExampleStateData) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('A quantidade de nomes é ${state.names.length}')));
              }
            },
            builder: (context, state) {
              print('Build');
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
        ],
      ),
    );
  }
}
