import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CellPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;
    final f = NumberFormat("(##) #####-####");
    String newText =
        f.format(int.parse(newValue.text.replaceAll(RegExp(r'[^\d]'), '')));
    int newCursorPosition = newText.length - selectionIndexFromTheRight;
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
  }
}
