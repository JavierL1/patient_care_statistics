import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class CustomDateTimePicker extends StatelessWidget {
  const CustomDateTimePicker({
    super.key,
    required this.title,
    required this.currentValue,
    required this.updateValue,
  });

  final String title;
  final DateTime currentValue;
  final void Function(DateTime) updateValue;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showOmniDateTimePicker(
      context: context,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      initialDate: currentValue,
      firstDate: DateTime(2023, 1),
      lastDate: DateTime(2030, 12),
      isForce2Digits: true,
      is24HourMode: true,
      isShowSeconds: true,
      minutesInterval: 1,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
    );

    if (picked != null && picked != currentValue) {
      updateValue(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Background color
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        border: Border.all(color: Colors.black54, width: 1.5), // Border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
          TextButton.icon(
            onPressed: () => _selectDate(context),
            icon: const Icon(Icons.calendar_today),
            label: Text(
              currentValue.format("dd/MM/yyyy HH:mm:ss"),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
