import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      required this.controller,
      this.prefix,
      this.maxLines = 1,
      this.hintText});
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final Widget? prefix;
  final int maxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          focusNode: focusNode,
          maxLines: widget.maxLines,
          controller: widget.controller,
          validator: (value) =>
              value == null || value.isEmpty ? 'field cannot be empty' : null,
          decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: widget.prefix,
              hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: focusNode.hasFocus
                      ? Colors.pink
                      : Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .color!
                          .withOpacity(.8)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey[300]!))),
        )
      ],
    );
  }
}
