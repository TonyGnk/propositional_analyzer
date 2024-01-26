import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:propositional_analyzer/Services/constants.dart';

TextEditingController kController = TextEditingController();
TextEditingController nController = TextEditingController();
TextEditingController sampleController = TextEditingController();
TextEditingController stopController = TextEditingController();

inPutField(
  BuildContext context,
  TextEditingController controller,
  String hint,
) =>
    Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize - 1),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      ),
      padding: const EdgeInsets.fromLTRB(17, 0, 17, 4),
      margin: const EdgeInsets.fromLTRB(7, 0, 7, 6),
      child: Row(
        children: [
          Icon(
            Icons.arrow_right,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ],
      ),
    );
