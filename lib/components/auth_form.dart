import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat/models/auth_form_data.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                if(_formData.isSignup)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text('Entrar'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _formData.toggleAuthMode();
                    });
                  },
                  child: Text(
                    _formData.isSignup
                        ? 'Já possui conta?':
                        'Criar uma nova conta?'
                        ,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
