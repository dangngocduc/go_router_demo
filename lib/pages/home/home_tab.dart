import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).push('/detail/10');
        },
        child: const Text('Open Detail'),
      ),
    );
  }
}
