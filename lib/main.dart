import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'September',
      home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Selamat Datang'),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: const Text('Halaman Register'))),
            ],
          ),
        ));
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Halaman Register'),
            Padding(
              padding:
                  const EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
              child: TextField(
                controller: _email,
                decoration: const InputDecoration(
                  hintText: 'Enter your email'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
              child: TextField(
                controller: _password,
                decoration: const InputDecoration(
                  hintText: 'Enter your password'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () async {}, child: const Text('Register')),
            )
          ],
        ),
      ),
    );
  }
}
