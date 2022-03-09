import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_sample/data/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _onLogin() {
    context.read<LoginCubit>().login('username', 'password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(label: Text('User Name'), filled: true),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(label: Text('Password'), filled: true),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: _onLogin,
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
