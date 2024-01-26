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
  String hint,IconData icon,
) =>
    Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerSize - 1),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.fromLTRB(7, 0, 7, 6),
      child: Row(
        children: [
          Center(
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 7),
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
