// lib/views/user/signup_view.dart

import 'package:cmovies/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomTextField(
                controller: _usernameController,
                hintText: 'Username',
                // isUsername: true,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                isEmail: true,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                isPassword: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process sign up
                    print('Signup Successful');
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
