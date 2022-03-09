import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/pages/home/home_tab.dart';
import 'package:go_router_sample/pages/home/profile_tab.dart';

class HomePage extends StatefulWidget {
  final int index;
  const HomePage({Key? key, required this.index}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    developer.log('didUpdateWidget ', name: 'HomePage');
    _pageController.jumpToPage(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: PageView(
        controller: _pageController,
        children: const [HomeTab(), ProfileTab()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index,
        onTap: (index) {
          if (index == 0) {
            GoRouter.of(context).go('/home/tab_0');
          } else {
            GoRouter.of(context).go('/home/tab_1');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_sharp), label: 'Profile'),
        ],
      ),
    );
  }
}
