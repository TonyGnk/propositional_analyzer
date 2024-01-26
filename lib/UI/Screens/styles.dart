// ignore_for_file: discarded_futures

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Components/Buttons/segmented_button.dart';
import '../Archive/screen/Settings Items/DropDown/dropdown_my.dart';
import '../Theme Services/ui_change.dart';
import '../Archive/templates/custom_animated.dart';

class StyleScreen extends StatefulWidget {
  const StyleScreen({
    super.key,
  });

  @override
  State<StyleScreen> createState() => _StyleScreenState();
}

class _StyleScreenState extends State<StyleScreen> {
  int uiValue = 0;

  //Initializer
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: materialStyles(
          context,
        ),
      );
  Widget materialStyles(
    BuildContext context,
  ) =>
      Scaffold(
        appBar: AppBar(
          title: const Text('Styles'),
        ),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Create 4 containers in green, blue, yellow and red color
              Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(3, 59, 111, 255),
                  borderRadius: BorderRadius.circular(16),
                ),
                width: MediaQuery.of(context).size.width,
                height: 380,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          color: const Color.fromARGB(5, 255, 0, 0),
                          width: 220,
                          height: 360,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Transform.scale(
                                    filterQuality: FilterQuality.high,
                                    alignment: Alignment.topLeft,
                                    scale: 0.6,
                                    child: const SizedBox(),
                                    //BasicScreen.buildSmall(context, 366.0, 600.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  //color: Color.fromARGB(143, 113, 141, 219),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: AdaptSegmentedButtons(
                  value: uiValue,
                  onPressed: [
                    () => toggleUI(context, 'material'),
                    () => toggleUI(context, 'oneUi'),
                  ],
                  labels: const ['Material', 'OneUI'],
                ),
              ),
              // animatedContainer(
              //   context,
              //   Colors.yellow.withOpacity(0.2),
              //   Container(
              //     width: 10,
              //     height: 10,
              //     decoration: const BoxDecoration(
              //         color: Color.fromARGB(54, 255, 255, 255)),
              //   ),
              // ),
              //AdaptElevatedButton(onPressed: () => null, label: 'Button'),
              animatedContainer(
                context,
                Colors.red.withOpacity(0),
                const MyDropdownWidget(),
              ),
            ],
          ),
        ]),
      );

  Widget animatedContainer(
    BuildContext context,
    Color color,
    Widget child,
  ) =>
      customAnimatedBox(
        width: MediaQuery.of(context).size.width,
        //height: 100,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
        ),
        child: child,
      );
}

// Widget oneUiStyles(BuildContext context,) =>
//     Scaffold(
//         appBar: AppBar(
//             //title: const Text('Basic'),
//             actions: [aboutAppIconButton]),
//         body: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.1,
//               ),
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 28),
//               ),
//               const SizedBox(
//                 height: 6,
//               ),
//               Text(
//                 version,
//                 style: const TextStyle(fontSize: 18),
//               ),
//               const Expanded(child: SizedBox()),
//               licensesButton(context),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),
//             ],
//           ),
//         ));

