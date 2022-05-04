import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/validators/validators.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_text_formfield.dart';
import 'package:cuidapet_mobile/app/modules/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

final _formKey = GlobalKey<FormState>();
final loginEC = TextEditingController();
final passwordEC = TextEditingController();
final confirmaPasswordEC = TextEditingController();

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  @override
  void dispose() {
    super.dispose();
    loginEC.dispose();
    passwordEC.dispose();
    confirmaPasswordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastre-se'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 1.statusBarHeight + 30,
              left: 20,
              right: 20,
            ),
            width: 1.sw,
            height: 1.sh - 1.statusBarHeight - kToolbarHeight,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150.w,
                    fit: BoxFit.fill,
                  ),
                  CuidapetTextFormfield(
                    label: 'Login',
                    controller: loginEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Login Obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CuidapetTextFormfield(
                    controller: passwordEC,
                    label: 'password',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatório'),
                      Validatorless.min(
                          6, 'Senha precisa ter pelo menos 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CuidapetTextFormfield(
                    controller: confirmaPasswordEC,
                    label: 'Confirmar password',
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Confrima senha Obrigatório'),
                        Validatorless.min(
                            6, 'Senha precisa ter pelo menos 6 caracteres'),
                        Validators.compare(passwordEC,
                            'Senha e confirma a senha não são iguais'),
                      ],
                    ),
                  ),
                  CuidapetDefaultButton(
                    label: 'Cadastrar',
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        controller.register(loginEC.text, passwordEC.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
