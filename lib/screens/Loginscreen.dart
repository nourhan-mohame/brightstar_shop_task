import 'package:brightstarshop/screens/Homescreen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 50.0),
            Column(
              children: <Widget>[
                Image.asset('assets/img.png'),
                const SizedBox(height: 10.0),
                const Text(
                  'Bright Star',
                  style: TextStyle(fontSize: 45),
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homescreen()),
                      );
                    },
                    child: Text('Next')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
