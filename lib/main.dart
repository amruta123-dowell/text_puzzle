import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'route_management/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: Routes.splash, getPages: Routes.routes);
  }
}



// class DisplayGridScreen extends StatelessWidget {
//   final List<String> enteredAlphabets;

//   DisplayGridScreen(this.enteredAlphabets);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Display Grid'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//           ),
//           itemCount: enteredAlphabets.length,
//           itemBuilder: (context, index) {
//             return Container(
//               color: Colors.blue,
//               child: Center(
//                 child: Text(
//                   enteredAlphabets[index],
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
