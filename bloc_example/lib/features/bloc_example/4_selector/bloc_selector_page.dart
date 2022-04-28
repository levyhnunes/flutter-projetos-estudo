import 'package:bloc_example/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSelectorPage extends StatelessWidget {
  const BlocSelectorPage({Key? key}) : super(key: key);

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
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final name = names[index];
                    return ListTile(
                      title: Text(name),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
