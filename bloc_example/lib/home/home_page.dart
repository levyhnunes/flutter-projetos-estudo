import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            TextButton(
              child: const Text('Bloc Builder'),
              onPressed: () => Navigator.pushNamed(context, '/bloc/builder/'),
            ),
            TextButton(
              child: const Text('Bloc Listener'),
              onPressed: () => Navigator.pushNamed(context, '/bloc/listener/'),
            ),
            TextButton(
              child: const Text('Bloc Consumer'),
              onPressed: () => Navigator.pushNamed(context, '/bloc/consumer/'),
            ),
            TextButton(
              child: const Text('Bloc Selector'),
              onPressed: () => Navigator.pushNamed(context, '/bloc/selector/'),
            ),
            TextButton(
              child: const Text('Bloc Crud'),
              onPressed: () => Navigator.pushNamed(context, '/bloc/crud/'),
            ),
          ],
        ),
      ),
    );
  }
}
