import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Components/List Tiles/list_tile_modifier.dart';
import 'settings_state.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      settingsReturn(ref);
    });
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTileModifier(
                  name: 'Customization',
                  cornerType: 'Both',
                  onTap: () => setState(() {
                    //child = const StyleScreen();
                  }),
                ),
                //const MyDropdownWidget(),
                const SizedBox(
                  height: 10,
                ),
                ListTileModifier(
                  name: 'About {_defaultApplicationName(context)}',
                  cornerType: 'Both',
                  //onTap setState and set in child the StyleScreen widget
                  onTap: () => setState(() {
                    // child = const AboutScreen();
                  }),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          //settingsTiles(context),
        ],
      );
}

// class _SettingsScreenState extends State<SettingsScreen> {
//   Widget child = const SizedBox();

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text('Settings'),
//         ),
//         body: MediaQuery.of(context).size.width > 800
//             ? SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: ListView(
//                         children: [
//                           ListTileModifier(
//                             name: 'Customization',
//                             cornerType: 'Both',
//                             onTap: () => setState(() {
//                               child = const StyleScreen();
//                             }),
//                           ),
//                           //const MyDropdownWidget(),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           ListTileModifier(
//                             name: 'About ${_defaultApplicationName(context)}',
//                             cornerType: 'Both',
//                             //onTap setState and set in child the StyleScreen widget
//                             onTap: () => setState(() {
//                               child = const AboutScreen();
//                             }),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: child,
//                     ),
//                     //settingsTiles(context),
//                   ],
//                 ),
//               )
//             : settingsTiles(context),

// OneUIPopupMenuButton(
//         itemBuilder: (context) => <PopupMenuEntry>[
//           const OneUIPopupMenuItem(child: Text('Option 1')),
//           const OneUIPopupMenuItem(child: Text('Option 2')),
//           OneUIPopupMenuItem(
//               child: ElevatedButton(
//                   onPressed: () {
//                     print('Hello');
//                   },
//                   child: Text('Option 3'))),
//         ],
//       )
// ListTileModifier(
//           name: 'About ${_defaultApplicationName(context)}',
//           cornerType: 'Both',
//           onTap: () => unawaited(
//             Navigator.push(
//                 context,
//                 PageRouteBuilder(
//                   pageBuilder: (context, animation, secondaryAnimation) =>
//                       const AboutScreen(),
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     var elasticAnimation = Tween(begin: 0.0, end: 1.0).animate(
//                       CurvedAnimation(
//                           parent: animation, curve: Curves.elasticInOut),
//                     );

//                     return ScaleTransition(
//                         scale: elasticAnimation, child: child);
//                   },
//                 )),
//           ),
//         ),
// body: Consumer(builder: (_, WidgetRef ref, __) {
//   bool showMenuVar = ref.watch(showMenu);
//   Enum selected = ref.watch(selectedStateProviderType);
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       customAnimatedBox(
//         width: MediaQuery.of(context).size.width,
//         height: 80,
//         clipBehavior: Clip.antiAlias,
//         decoration: const BoxDecoration(),
//         child: ElevatedButton(
//           onPressed: () {
//             //On press change the value of showMenu to the opposite
//             ref.read(showMenu.notifier).state = !showMenuVar;
//           },
//           style: ElevatedButton.styleFrom(
//             elevation: 1,
//             backgroundColor: const Color.fromARGB(255, 43, 43, 43),
//             shape: showMenuVar
//                 ? const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(0.0),
//                       bottomRight: Radius.circular(0.0),
//                       topLeft: Radius.circular(40.0),
//                       topRight: Radius.circular(40.0),
//                     ),
//                   )
//                 : const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(40.0),
//                       bottomRight: Radius.circular(40.0),
//                       topLeft: Radius.circular(40.0),
//                       topRight: Radius.circular(40.0),
//                     ),
//                   ),
//           ),
//           child: Row(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Θέμα Εφαρμογής',
//                     style: TextStyle(
//                         fontSize: 19,
//                         color:
//                             Theme.of(context).colorScheme.onBackground),
//                   ),
//                   !showMenuVar
//                       ? Text(
//                           ref
//                               .watch(selectedStateProviderType)
//                               .toString(),
//                           style: TextStyle(
//                             //Set color from theme the onPrimary
//                             color:
//                                 Theme.of(context).colorScheme.primary,
//                           ),
//                         )
//                       : const SizedBox()
//                 ],
//               ),
//               const Expanded(child: SizedBox())
//             ],
//           ),
//         ),
//       ),
//       customAnimatedBox(
//         width: MediaQuery.of(context).size.width,
//         height: showMenuVar ? 80 : 0,
//         clipBehavior: Clip.antiAlias,
//         decoration: const BoxDecoration(),
//         child: ElevatedButton(
//           onPressed: () {
//             //On press change the value of selectedStateProviderType to Oneui
//             ref.read(selectedStateProviderType.notifier).state =
//                 StateProviderType.oneUi;
//             //On press also change the value of showMenu to the opposite
//             ref.read(showMenu.notifier).state = !showMenuVar;
//           },
//           style: ElevatedButton.styleFrom(
//             elevation: 1,
//             backgroundColor: const Color.fromARGB(255, 43, 43, 43),
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(0.0),
//               ),
//             ),
//           ),
//           child: Row(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'OneUi',
//                     style: TextStyle(
//                         fontSize: 19,
//                         color: currentActive(selected, 'oneUi')
//                             ? Theme.of(context).colorScheme.primary
//                             : Theme.of(context)
//                                 .colorScheme
//                                 .onBackground),
//                   ),
//                 ],
//               ),
//               const Expanded(child: SizedBox()),
//               currentActive(selected, 'oneUi')
//                   ? const Icon(
//                       Icons.check,
//                       color: Colors.white,
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//         ),
//       ),
//       customAnimatedBox(
//         width: MediaQuery.of(context).size.width,
//         height: showMenuVar ? 80 : 0,
//         clipBehavior: Clip.antiAlias,
//         decoration: const BoxDecoration(),
//         child: ElevatedButton(
//           onPressed: () {
//             ref.read(selectedStateProviderType.notifier).state =
//                 StateProviderType.material;
//             ref.read(showMenu.notifier).state = !showMenuVar;
//           },
//           style: ElevatedButton.styleFrom(
//             elevation: 1,
//             backgroundColor: const Color.fromARGB(255, 43, 43, 43),
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(40.0),
//                 bottomRight: Radius.circular(40.0),
//                 topLeft: Radius.circular(0.0),
//                 topRight: Radius.circular(0.0),
//               ),
//             ),
//           ),
//           child: Row(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Material You',
//                     style: TextStyle(
//                         fontSize: 19,
//                         color: currentActive(selected, 'material')
//                             ? Theme.of(context).colorScheme.primary
//                             : Theme.of(context)
//                                 .colorScheme
//                                 .onBackground),
//                   ),
//                 ],
//               ),
//               const Expanded(child: SizedBox()),
//               currentActive(selected, 'material')
//                   ? const Icon(
//                       Icons.check,
//                       color: Colors.white,
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//         ),
//       ),
//       const Text('Έκδοση Εφαρμογής: 1.0.0'),
// height: 90,
// child: custom.PopupMenuButton<StateProviderType>(
//   //pos little bit left from the start point
//   elevation: 9,
//   constraints: const BoxConstraints(
//     minWidth: 220,
//     maxWidth: 220,
//   ),
//   //clipBehavior: Clip.hardEdge,

//   child: Container(
//     padding: const EdgeInsets.fromLTRB(33, 0, 33, 0),
//     child: ElevatedButton(
//       onPressed: () {},
//       child: const Text('Hello'),
//     ),
//   ),

// customAnimatedBox(
//   //width full space
//   width: MediaQuery.of(context).size.width,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(50.0),
//     color: const Color.fromARGB(255, 43, 43, 43),
//   ),
//   padding: const EdgeInsets.fromLTRB(33, 0, 33, 0),
//   clipBehavior: Clip.antiAlias,
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Text(
//         'Θέμα Εφαρμογής',
//         style: TextStyle(fontSize: 19),
//       ),
//       Text(
//         ref.watch(selectedStateProviderType).toString(),
//         style: TextStyle(
//           //Set color from theme the onPrimary
//           color: Theme.of(context).colorScheme.primary,
//         ),
//       ),
//     ],
//   ),
// ),

// onSelected: (stateProviderType) {
//   ref.read(selectedStateProviderType.notifier).state =
//       stateProviderType;
// },
// itemBuilder: (BuildContext context) =>
//     <custom.PopupMenuEntry<StateProviderType>>[
//   const custom.PopupMenuItem<StateProviderType>(
//     value: StateProviderType.oneUi,
//     child: Text('OneUI'),
//   ),
//   const custom.PopupMenuItem<StateProviderType>(
//     value: StateProviderType.material,
//     child: Text('Material'),
//   ),
//   const custom.PopupMenuItem<StateProviderType>(
//     value: StateProviderType.cupertino,
//     child: Text('Cupertino'),
//   ),
//   const custom.PopupMenuItem<StateProviderType>(
//     value: StateProviderType.fluid,
//     child: Text('Fluid'),
//   ),
// ],
//),
// );

//Create the Listview in a seperate widget
Widget settingsTiles(BuildContext context) => ListView(
      children: [
        ListTileModifier(
          name: 'Customization',
          cornerType: 'Both',
          onTap: () => unawaited(Navigator.pushNamed(
            context,
            '/settings/customization',
          )),
        ),
        //const MyDropdownWidget(),
        const SizedBox(
          height: 10,
        ),
        ListTileModifier(
          name: 'About ${_defaultApplicationName(context)}',
          cornerType: 'Both',
          onTap: () => unawaited(Navigator.pushNamed(
            context,
            '/settings/about',
          )),
        ),
      ],
    );

//Create the bool function currentActive(selected,'oneUI')
bool currentActive(Enum selected, String name) {
  //Συνένωσε το 'StateProviderType.'με το name
  name = 'StateProviderType.$name';
  if (selected.toString() == name) {
    return true;
  } else {
    return false;
  }
}

String _defaultApplicationName(BuildContext context) {
  final Title? ancestorTitle = context.findAncestorWidgetOfExactType<Title>();
  return ancestorTitle?.title ??
      Platform.resolvedExecutable.split(Platform.pathSeparator).last;
}
//}

// enum StateProviderType { oneUi, cupertino, material, fluid }

// final selectedStateProviderType =
//     StateProvider<StateProviderType>((ref) => StateProviderType.oneUi);

final showMenu = StateProvider<bool>((ref) => false);
