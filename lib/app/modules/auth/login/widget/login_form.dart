import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_text_formfield.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends ModularState<LoginForm, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _loginEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CuidapetTextFormfield(
            label: 'Login',
            controller: _loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Login obrigatório'),
              Validatorless.email('E-mail inválido'),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          CuidapetTextFormfield(
            label: 'Senha',
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatório'),
              Validatorless.min(6, 'Senha precisa ter 6 caracteres')
            ]),
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          CuidapetDefaultButton(
              label: 'Entrar',
              onPressed: () {
                final formValid = _formKey.currentState?.validate() ?? false;
                if (formValid) {
                  controller.login(
                    _loginEC.text,
                    _passwordEC.text,
                  );
                }
              }),
        ],
      ),
    );
  }
}
