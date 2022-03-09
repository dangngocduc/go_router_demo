import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/data/login_cubit.dart';
import 'package:go_router_sample/pages/auth/login_page.dart';

import 'data/login_state.dart';
import 'pages/detail/detail_page.dart';
import 'pages/home/home_page.dart';
import 'pages/detail/review_page.dart';

void main() {
  final cubit = LoginCubit();
  GetIt.instance.registerSingleton(cubit);
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider.value(value: GetIt.instance.get<LoginCubit>())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    initialLocation: '/',
    refreshListenable: GetIt.instance.get<LoginCubit>(),
    redirect: (state) {
      developer.log('state.subloc : ${state.subloc}', name: 'Main.redirect');
      bool isLoggedIn =
          GetIt.instance.get<LoginCubit>().state is LoginStateAuthorized;
      final loggingIn = state.subloc == '/login';
      if (loggingIn) {
        //User muon login
        if (isLoggedIn) {
          developer.log('redirect to /', name: 'Main.redirect');
          return '/';
        } else {
          developer.log('redirect to null', name: 'Main.redirect');
          return null;
        }
      } else {
        if (isLoggedIn) {
          developer.log('redirect to null', name: 'Main.redirect');
          return null;
        } else {
          developer.log('redirect to /login', name: 'Main.redirect');
          return '/login';
        }
      }
    },
    navigatorBuilder: (context, state, child) {
      developer.log('navigatorBuilder build', name: 'Main');
      return child;
    },
    routes: [
      GoRoute(
        path: '/',
        redirect: (state) => '/home',
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        redirect: (_) => '/home/tab_0',
      ),
      GoRoute(
        path: '/home/:tab',
        builder: (context, state) {
          return HomePage(
            index: state.params['tab'] == 'tab_0' ? 0 : 1,
          );
        },
      ),
      GoRoute(
        path: '/detail/:productID',
        builder: (context, state) => DetailPage(
          productId: int.parse(state.params['productID'] ?? ''),
        ),
        routes: [
          GoRoute(
            path: 'review',
            builder: (context, state) => const ReviewPage(),
          ),
        ],
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
