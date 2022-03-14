import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CuidapetTextFormfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final IconButton? suffixIcon;
  final ValueNotifier<bool> _obscureTextVn;

  CuidapetTextFormfield({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  })  : _obscureTextVn = ValueNotifier<bool>(obscureText),
        assert(
          obscureText == true ? suffixIcon == null : true,
          'obscureText não pode ser adicionado junto com o sufficicon',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVn,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextValue,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              gapPadding: 0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              gapPadding: 0,
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      _obscureTextVn.value = !obscureTextValue;
                    },
                    icon: Icon(
                      obscureTextValue ? Icons.block_outlined : Icons.lock_open,
                      color: context.primaryColor,
                    ),
                  )
                : suffixIcon,
          ),
        );
      },
    );
  }
}
