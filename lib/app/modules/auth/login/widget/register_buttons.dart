import 'package:cuidapet_mobile/app/core/ui/extensions/cuidapet_icons.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/rounded_button_with_icon.dart';
import 'package:cuidapet_mobile/app/models/social_type.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';

class RegisterButtons extends StatelessWidget {
  final LoginController _loginController;

  const RegisterButtons({Key? key, required LoginController loginController})
      : _loginController = loginController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        RoundedButtonWithIcon(
          icon: Cuidapeticons.facebook,
          width: .47.sw,
          title: 'Facebook',
          color: Color(0xDD4267B3),
          onTap: () {},
        ),
        RoundedButtonWithIcon(
          icon: Cuidapeticons.google,
          width: .47.sw,
          title: 'Google',
          color: Color(0XffE15031),          
          onTap: () => _loginController.socialLogin(SocialType.google) ,
        ),
        RoundedButtonWithIcon(
          icon: Icons.mail,
          width: .47.sw,
          title: 'Cadastre-se',
          color: context.primaryColorDark,
          onTap: () => Navigator.pushNamed(context, '/register'),
        ),
      ],
    );
  }
}
