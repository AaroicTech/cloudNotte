import 'package:flutter/material.dart';

//number of players
Widget droupDown({
  BuildContext? context,
  Function(String)? onChanged,
  String? dropdownValue,
  List? items,
  double? height,
  String? hint,
  String? path = '',
  double? borderRadius,
  bool disable = false,
  Color? bgColor,
  Color? textColor,
}) {
  return DropdownButton<String>(
    isExpanded: true,
    value: dropdownValue,
    hint: const Text("Select number of players"),
    icon: Icon(
      Icons.people,
      size: 40,
     // color: indigo,
    ),
    elevation: 16,
    style: const TextStyle(color: Colors.deepPurple),
    underline: Container(),
    onChanged: (value) => onChanged!(value!),
    items: <String>[
      'Select Subject',
        'Physics',
        'Chemistry',
        'Maths',
        'Biology',
        'Earthscience',
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
         // style: textStyle0,
        ),
      );
    }).toList(),
  );
}