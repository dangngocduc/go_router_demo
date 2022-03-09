import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends StatefulWidget {
  final int productId;
  const DetailPage({Key? key, required this.productId}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    developer.log('Init state for detail page: ${widget.productId}',
        name: 'DetailPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            if (GoRouter.of(context).navigator?.canPop() == true) {
              GoRouter.of(context).pop();
            } else {
              GoRouter.of(context).go('/home');
            }
          },
        ),
        title: const Text('Detail Product'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push('/detail/${widget.productId}/review');
          },
          child: const Text('Review'),
        ),
      ),
    );
  }
}
