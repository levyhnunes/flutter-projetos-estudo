import 'package:bloc_example/features/bloc_example/5_crud/bloc_crud_page.dart';
import 'package:bloc_example/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/bloc_example/1_builder/bloc_builder_page.dart';
import 'features/bloc_example/2_listener/bloc_listener_page.dart';
import 'features/bloc_example/3_consumer/bloc_consumer_page.dart';
import 'features/bloc_example/4_selector/bloc_selector_page.dart';
import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/home': (_) => const HomePage(),
        '/bloc/builder/': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocBuilderPage(),
            ),
        '/bloc/listener/': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocListenerPage(),
            ),
        '/bloc/consumer/': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocConsumerPage(),
            ),
        '/bloc/selector/': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocSelectorPage(),
            ),
        '/bloc/crud/': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocCrudPage(),
            ),
      },
    );
  }
}
