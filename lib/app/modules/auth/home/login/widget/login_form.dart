import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_text_formfield.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CuidapetTextFormfield(
          label: 'Login',
        ),
        const SizedBox(
          height: 10,
        ),
        CuidapetTextFormfield(
          label: 'Senha',
          obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        CuidapetDefaultButton(label: 'Entrar', onPressed: () {}),
      ],
    );
  }
}
