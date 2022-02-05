import 'package:flutter/material.dart';

class AuthFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String title, hint;
  final bool password;
  const AuthFormField(this.title,
      {required this.hint, this.controller, this.password = false, Key? key})
      : super(key: key);

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction:
          widget.password ? TextInputAction.done : TextInputAction.next,
      cursorColor: Colors.white,
      obscureText: widget.password ? !_showPassword : false,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(widget.title),
        labelStyle: const TextStyle(color: Colors.white),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.white54),
        suffixIcon: widget.password
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: _showPassword ? Colors.white : Colors.white60,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white38),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
