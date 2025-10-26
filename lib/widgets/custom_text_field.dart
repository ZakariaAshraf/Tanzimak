import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? suffixText;
  final String? title;
  final void Function(String)? onChanged;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixText,
    this.onChanged,
    this.isPassword = false, this.title,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ?widget.title != null ? Text(widget.title!, style: theme.titleSmall) : null,
          TextFormField(
            style: const TextStyle(color: Colors.black),
            onChanged: widget.onChanged,
            controller: widget.controller,
            obscureText: _obscure,
            decoration: InputDecoration(
              filled: true,
              hintText: widget.hintText,
              hintStyle: theme.titleMedium!.copyWith(color: Colors.grey),
              suffixText: widget.suffixText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                icon: Icon(
                  _obscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              )
                  : null,
            ),
            validator: (val) =>
            val == null || val.isEmpty ? 'Please fill this' : null,
          ),
        ],
      ),
    );
  }
}
