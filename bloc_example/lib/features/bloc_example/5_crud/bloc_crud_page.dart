import 'package:bloc_example/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCrudPage extends StatelessWidget {
  const BlocCrudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocSelector'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            BlocSelector<ExampleBloc, ExampleState, bool>(
              selector: (state) => state is ExampleStateInitial,
              builder: (context, showLoader) {
                return showLoader
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : const SizedBox.shrink();
              },
            ),
            BlocSelector<ExampleBloc, ExampleState, List<String>>(
              selector: (state) => state is ExampleStateData ? state.names : [],
              builder: (context, names) {
                print('Build Chamado');
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final name = names[index];
                    return ListTile(
                      title: Text(name),
                      onTap: () {
                        context
                            .read<ExampleBloc>()
                            .add(ExampleRemoveNameEvent(name: name));
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return BlocAddNamePage(context.read<ExampleBloc>());
              });
        },
      ),
    );
  }
}

class BlocAddNamePage extends StatelessWidget {
  const BlocAddNamePage(this.exampleBloc, {Key? key}) : super(key: key);

  final ExampleBloc exampleBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
            textCapitalization: TextCapitalization.sentences,
            onSubmitted: (value) {
              exampleBloc.add(ExampleAddNameEvent(name: value));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
