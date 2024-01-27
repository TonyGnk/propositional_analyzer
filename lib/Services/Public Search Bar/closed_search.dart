import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import 'main_search.dart';

//Bool provider
final stepModeProvider = StateProvider<bool>((ref) => false);

closedSearch(bool compareMode) => Consumer(
      builder: (context, WidgetRef ref, __) => row(context, compareMode),
    );

row(BuildContext context, bool compareMode) => Row(
      children: [
        inPutFieldBf(context, inputController, 'Initial Value'),
        const SizedBox(width: 6),
        inPutFieldBf(context, targetController, 'Target Value'),
        const SizedBox(width: 6),
        !compareMode ? showOptionsButton() : const SizedBox(),
        !compareMode ? const SizedBox(width: 3) : const SizedBox(),
        !compareMode ? submitButton() : submitButtonCompare()
      ],
    );

TextEditingController inputController = TextEditingController();
TextEditingController targetController = TextEditingController();

inPutFieldBf(
  BuildContext context,
  TextEditingController controller,
  String hint,
) =>
    Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerSize - 1),
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        ),
        padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
        child: Center(
          child: TextField(
            controller: controller,
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
      ),
    );

showOptionsButton() => Consumer(
      builder: (context, WidgetRef ref, __) {
        final makeContainerTaller = ref.watch(makeContainerTallerProvider);
        final showTheExtraOptions = ref.watch(showTheExtraOptionsProvider);
        return IconButton(
          style: modernButtonStyle(context),
          icon: makeContainerTaller
              ? const Icon(Icons.close)
              : const Icon(Icons.tune_outlined),
          onPressed: () {
            makeContainerTaller
                ? ref.read(makeContainerTallerProvider.notifier).state = false
                : moreOptionsFun(ref);
            showTheExtraOptions
                ? ref.read(showTheExtraOptionsProvider.notifier).state = false
                : null;
          },
        );
      },
    );

modernButtonStyle(BuildContext context) => ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerSize - 1),
        ),
      ),
    );

moreOptionsFun(WidgetRef ref) async {
  ref.read(makeContainerTallerProvider.notifier).state = true;
  await Future.delayed(const Duration(milliseconds: 140));
  ref.read(showTheExtraOptionsProvider.notifier).state = true;
}

Widget submitButton() => Consumer(
      builder: (context, WidgetRef ref, __) => IconButton.filled(
        style: modernButtonStyle(context),
        icon: const Icon(Icons.auto_awesome_outlined),
        onPressed: () {
          if (inputController.text.isNotEmpty &&
              targetController.text.isNotEmpty) {
            //onButtonPressed(ref);
          }
        },
      ),
    );

Widget submitButtonCompare() => Consumer(
      builder: (context, WidgetRef ref, __) => Center(
        child: FilledButton.icon(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
              const Size(130, 40),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerSize - 1),
              ),
            ),
          ),
          icon: const Icon(Icons.compare_arrows_outlined),
          onPressed: () {},
          label: const Text(
            'Compare',
            style: TextStyle(fontFamily: 'Play'),
          ),
        ),
      ),
    );
