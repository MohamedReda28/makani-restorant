import 'package:flutter/material.dart';

import '../uitels/App_TextStyle.dart';

class DropdownTextFormField extends StatefulWidget {
  final List<String> items;
  final String? initialValue;
  final Function(String) onChanged;
  final String label;

  const DropdownTextFormField({
    super.key,
    required this.items,
    required this.onChanged,
    this.initialValue,
    this.label = "اختر",
  });

  @override
  State<DropdownTextFormField> createState() => _DropdownTextFormFieldState();
}

class _DropdownTextFormFieldState extends State<DropdownTextFormField> {
  late TextEditingController _controller;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
    _controller = TextEditingController(text: selectedValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDropdownChanged(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedValue = newValue;
      _controller.text = newValue;
    });
    widget.onChanged(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),

        helperStyle: AppStyle.bold13.copyWith(color: const Color(0xFF949D9E)),
        labelText: widget.label,
        suffixIcon: DropdownButton<String>(
         //value: selectedValue,
          underline: const SizedBox(),
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: _onDropdownChanged,
          items: widget.items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
      validator: (value) => value == null || value.isEmpty ? 'الرجاء اختيار الصنف ' : null,
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
