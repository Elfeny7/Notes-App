import 'package:flutter/material.dart';
import 'package:september_app/constants/routes.dart';
import 'package:september_app/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                  'Email verification already sent, please open to verify'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text('Press button below if you not received email:'),
            ),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().sendEmailVerification();
              },
              child: const Text('Send Email Verification'),
            ),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                if (!mounted) return;
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
