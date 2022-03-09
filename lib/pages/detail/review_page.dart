import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text('Review Page'),
      ),
    );
  }
}
