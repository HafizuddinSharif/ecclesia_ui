import 'package:ecclesia_ui/data/models/choice_model.dart';
import 'package:flutter/material.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  final String value;
  final String groupValue;
  final IconData? leading;
  final Widget? title;
  final Function onChanged;
  final Choice choice;

  const CustomRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    required this.title,
    required this.choice,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value, choice),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _customRadioButton,
            const SizedBox(width: 12),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        // borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.black,
          width: 1,
        ),
      ),
      child: Icon(
        leading,
        size: 35,
        color: isSelected ? Colors.white : Colors.white,
      ),
    );
  }
}
