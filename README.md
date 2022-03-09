# go_router_sample
Demo:

https://user-images.githubusercontent.com/10508979/157477262-46fd1ae8-2623-4da1-9d12-719f9ecb090b.mov

Router Config: 
```dart
  final _router = GoRouter(
    initialLocation: '/',
    refreshListenable: GetIt.instance.get<LoginCubit>(),
    redirect: (state) {
      developer.log('state.subloc : ${state.subloc}', name: 'Main.redirect');
      bool isLoggedIn =
          GetIt.instance.get<LoginCubit>().state is LoginStateAuthorized;
      final loggingIn = state.subloc == '/login';
      if (loggingIn && isLoggedIn) {
        return '/';
      } else {
        if (!isLoggedIn) {
          return '/login';
        }
      }
      return null;
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
  ```
