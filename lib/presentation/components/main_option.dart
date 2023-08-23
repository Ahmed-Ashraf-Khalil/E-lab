import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MainOption extends StatelessWidget {
  final String title;
  final String hint;
  final Function onChanged;
  final List items;
  final String? answer;

  const MainOption({Key? key, required this.title, required this.hint, required this.onChanged, required this.items, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          padding: const EdgeInsets.only(right: 8, left: 8),
          decoration: BoxDecoration(
            color: HexColor('#6DADB1'),
            border: Border.all(),
            borderRadius:
            const BorderRadius.all(Radius.circular(15)),
          ),
          child: DropdownButton(
            value: answer,
            elevation: 30,
            borderRadius:
            const BorderRadius.all(Radius.circular(15)),
            hint: Text(
              hint,
              style: const TextStyle(color: Colors.white70),
            ),
            dropdownColor: HexColor('#6DADB1'),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            onChanged: (newValue) {
              onChanged(newValue);
            },
            underline: Container(
              height: 0,
              color: Colors.black,
            ),
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            items: items
                .map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style:
                  const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
