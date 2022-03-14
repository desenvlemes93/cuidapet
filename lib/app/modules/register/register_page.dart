import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_text_formfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();

 

class _RegisterPageState extends State<RegisterPage> {

  @override
  void dispose() {
      super.dispose();
    _loginEC.dispose();
    _passwordEC.dispose();
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
                    controller: _loginEC,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CuidapetTextFormfield(
                    controller: _passwordEC,
                    label: 'password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CuidapetTextFormfield(
                    label: 'Confirmar password',
                    obscureText: true,
                  ),
                  CuidapetDefaultButton(label: 'Cadastrar', onPressed: () {}),
                ],
              ),
            ),
          ),
        ));
  }
}
