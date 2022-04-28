import 'package:bloc_example/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerPage extends StatelessWidget {
  const BlocListenerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocListener'),
      ),
      body: BlocListener<ExampleBloc, ExampleState>(
        listenWhen: (previous, current) {
          return current is ExampleStateData && current.names.length > 1
              ? true
              : false;
        },
        listener: (context, state) {
          print('Estado alterado!');
          if (state is ExampleStateData) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('A quantidade de nomes é ${state.names.length}')));
          }
        },
        child: Column(
          children: [
            BlocBuilder<ExampleBloc, ExampleState>(
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
      ),
    );
  }
}
