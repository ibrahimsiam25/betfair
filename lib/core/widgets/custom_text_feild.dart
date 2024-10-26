import 'dart:ui';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final Function(String) onChanged;
  final Widget? icon;

  const CustomTextField({
    Key? key,
    required this.onChanged,
    this.icon,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();
Future<void> _selectDate(BuildContext context) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
         primaryColor: AppColors.primary, // Color of the selected date
          dialogBackgroundColor: Colors.black, // Background color of the dialog
          scaffoldBackgroundColor: Colors.black, // Background color of the scaffold
          colorScheme: ColorScheme.dark(primary: AppColors.primary), // Dark color scheme
          buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary), // Button color
        ),
        child: child!,
      );
    },
  );

  if (selectedDate != null) {
    String formattedDate = DateFormat('yyyy/MM/dd').format(selectedDate);
    _controller.text = formattedDate; // Update the text field with the formatted date
    widget.onChanged(formattedDate); // Call the onChanged function
  }
}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.darkPrimary.withOpacity(0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkPrimary.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.2),
            child: TextField(
              controller: _controller, // Use the stateful controller
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: widget.icon != null
                    ? const EdgeInsets.fromLTRB(20, 15, 0, 15)
                    : const EdgeInsets.symmetric(horizontal: 20),
                suffixIcon: widget.icon != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget.icon,
                      )
                    : null,
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              cursorColor: AppColors.darkPrimary,
              onChanged: widget.onChanged,
              readOnly: widget.icon != null,
              onTap: widget.icon != null
                  ? () => _selectDate(context) // No longer need to pass controller
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
