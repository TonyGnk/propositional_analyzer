import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';

speakerIcon() => Consumer(
      builder: (context, ref, _) {
        final isMute = ref.watch(isMuteProvider);
        return IconButton(
          isSelected: isMute,
          tooltip: 'Play Sound At The End',
          selectedIcon: const Icon(Icons.volume_off_outlined),
          onPressed: () {
            ref.read(isMuteProvider.notifier).state = !isMute;
            speakerOn = isMute;
            print('speakerOn: $isMute');
          },
          icon: const Icon(Icons.volume_up_outlined),
          highlightColor: Colors.grey.withOpacity(0.2),
        );
      },
    );

final isMuteProvider = StateProvider<bool>((ref) => true);
