import 'package:flutter/material.dart';
import 'package:patient_care_statistics/widgets/cute_box.dart';
import 'package:patient_care_statistics/widgets/form_item_button.dart';

class SimplePicker<T> extends StatelessWidget {
  const SimplePicker({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onSelect,
    required this.items,
  });

  final String title;
  final String subtitle;
  final void Function(T) onSelect;
  final List<({String name, T value})> items;

  @override
  Widget build(BuildContext context) {
    return FormItemButton(
      title: title,
      subtitle: subtitle,
      onTap: () async => await showDialog<T>(
          context: context,
          builder: (BuildContext context) {
            return _SimplePickerDialog<T>(
              title: title,
              items: items,
              onSelect: onSelect,
            );
          }),
    );
  }
}

class _SimplePickerDialog<T> extends StatelessWidget {
  final List<({String name, T value})> items;
  final String title;
  final void Function(T) onSelect;

  const _SimplePickerDialog({
    super.key,
    required this.items,
    required this.title,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    items.sort((a, b) => a.name.compareTo(b.name));

    return SimpleDialog(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      children: items
          .map(
            (item) => SimpleDialogOption(
              onPressed: () {
                onSelect(item.value);
                Navigator.pop(context);
              },
              child: _PickerItemLabel(label: item.name),
            ),
          )
          .toList(),
    );
  }
}

class _PickerItemLabel extends StatelessWidget {
  final String label;

  const _PickerItemLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return CuteBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
