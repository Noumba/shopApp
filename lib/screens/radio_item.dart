import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytech1/models/custom_radio.dart';

class RadioItem extends StatelessWidget {
  final RadioModel radioItem;

  const RadioItem({Key? key, required this.radioItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 40,
      width: siz.width * 0.2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        shape: BoxShape.rectangle,
        border: Border.all(color: radioItem.color, width: 2.0),
        color: radioItem.isSelected ? radioItem.color : Colors.transparent,
      ),
      child: Center(
          child: Text(radioItem.buttonText,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color:
                    (radioItem.isSelected & (radioItem.color == Colors.white))
                        ? Colors.black87
                        : radioItem.isSelected
                            ? Colors.white
                            : Colors.black,
              ))),
    );
  }
}
