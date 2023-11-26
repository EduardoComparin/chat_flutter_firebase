
import 'package:chat_flutter_firebase/shared/widgets/custon_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Menu'),
        ),
        drawer: const CustonDrawer(),
        body: Container(),
      ),
    );
  }
}
