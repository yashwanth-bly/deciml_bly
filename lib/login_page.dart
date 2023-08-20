import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login/Register page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Deciml",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            const Text(
              "By Yashwanth B L",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 40,
            ),
            const TextField(
              // obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: 'User Name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                labelText: 'User Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              // obscureText: true,
              decoration: InputDecoration(
                hintText: 'password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()),
                        );
                      },
                      child: const Icon(Icons.login));
                },
                child: const Text("Sign In"))
          ],
        ),
      ),
    );
  }
}
