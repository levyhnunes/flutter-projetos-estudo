import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_controller.dart';

class ContadorCodeGenPage extends StatefulWidget {
  ContadorCodeGenPage({Key? key}) : super(key: key);

  @override
  State<ContadorCodeGenPage> createState() => _ContadorCodeGenPageState();
}

class _ContadorCodeGenPageState extends State<ContadorCodeGenPage> {
  final controller = ContadorCodeGenController();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    // autorun fica escutando as variaveis que estao sendo usadas dentro e também roda logo quando criado
    final autorunDisposer = autorun((_) {
      print('-------------- auto run --------------');
      print(controller.fullName.first);
    });

// soh roda quando o counter eh modificado
    final reactionCounterDisposer =
        reaction((_) => controller.counter, (counter) {
      print('--------- raction ------------');
    });

// soh roda quando a condicao eh atendida e uma unica vez
    final whenDisposer = when((_) => controller.fullName.first == 'Levyh', () {
      print('--------- when --------');
    });

    reactionDisposer.add(autorunDisposer);
    reactionDisposer.add(reactionCounterDisposer);
  }

  @override
  void dispose() {
    super.dispose();
    for (var reaction in reactionDisposer) {
      reaction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador mobx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) {
              return Text(
                '${controller.counter}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Observer(builder: (_) {
              return Text(
                controller.fullName.first,
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Observer(builder: (_) {
              return Text(
                controller.fullName.last,
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Observer(builder: (_) {
              return Text(
                controller.saudacao,
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            TextButton(
              onPressed: () => controller.changeName(),
              child: const Text('Change Name'),
            ),
            TextButton(
              onPressed: () => controller.rollbackName(),
              child: const Text('Rollback Name'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
