// import 'package:flutter/material.dart';

// class HydrationPage extends StatefulWidget {
//   const HydrationPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _HydrationPageState createState() => _HydrationPageState();
// }

// class _HydrationPageState extends State<HydrationPage> {
//   // Track the current water intake value
//   double _waterIntake = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hydration'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Water Intake Today:',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             Text(
//               '${_waterIntake.toStringAsFixed(2)} cups',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: () {
//                 // Show a dialog to input water intake
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: const Text('Water Intake'),
//                     content: TextField(
//                       autofocus: true,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                         hintText: 'Enter the amount in cups',
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _waterIntake = double.tryParse(value) ?? 0.0;
//                         });
//                       },
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('Cancel'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text('Save'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: const Text('Add Water Intake'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HydrationPage extends StatefulWidget {
  @override
  _HydrationPageState createState() => _HydrationPageState();
}

class _HydrationPageState extends State<HydrationPage> {
  int _currentIntake = 0;

  void _incrementIntake() {
    setState(() {
      _currentIntake++;
    });
  }

  void _decrementIntake() {
    setState(() {
      _currentIntake--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Intake',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              '$_currentIntake oz',
              style: TextStyle(fontSize: 48.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _decrementIntake,
                  tooltip: 'Decrement Intake',
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: _incrementIntake,
                  tooltip: 'Increment Intake',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
