import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:watintake/services/recommendation_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              const Text(
                "Welcome back,",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 4),
              const Text(
                "User Name",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.local_drink),
                        SizedBox(height: 8),
                        Text(
                          "Hydration",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("1000 ml"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.directions_run),
                        SizedBox(height: 8),
                        Text(
                          "Activity",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("60 min"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.local_cafe),
                        SizedBox(height: 8),
                        Text(
                          "Caffeine",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("0 mg"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Daily Goal",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Hydration",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("2000 ml"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Activity",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("120 min"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Caffeine",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("500 mg"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  var url = Uri.parse('https://www.fitbit.com/oauth2/authorize');
                  var response = await http.get(url);
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');
                },
                child: Text("Start Workout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//2ND

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:watintake/models/hydration_entry.dart';
// import 'package:watintake/services/hydration_service.dart';
// import 'package:watintake/services/recommendation_service.dart';

// import '../../models/user.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Future<int> _hydrationTarget;
//   late Future<List<HydrationEntry>> _hydrationEntries;
//   final _hydrationService = HydrationService();
//   final _dateFormat = DateFormat('dd/MM/yyyy');

//   @override
//   void initState() {
//     super.initState();
//     _getHydrationTarget();

//     _hydrationTarget = RecommendationService().getDailyIntake(
//       age: 25,
//       gender: Gender.female,
//       weight: 60.0,
//       height: 165.0,
//     );
//     _hydrationEntries = _hydrationService.getHydrationEntries();
//   }

//   Future<void> _getHydrationTarget() async {
//     final recommendationService = RecommendationService();
//     final dailyIntake = await recommendationService.getDailyIntake(
//         age: 25, gender: Gender.male, weight: 70.0, height: 170.0);
//     setState(() {
//       _hydrationTarget = Future.value(dailyIntake);
//     });
//   }

//   Future<void> _refreshData() async {
//     setState(() {
//       _hydrationTarget = RecommendationService().getDailyIntake(
//         age: 25,
//         gender: Gender.female,
//         weight: 60.0,
//         height: 165.0,
//       );
//       _hydrationEntries = _hydrationService.getHydrationEntries();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Water Intake Tracker'),
//       ),
//       body: RefreshIndicator(
//         onRefresh: _refreshData,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const SizedBox(height: 16.0),
//                 FutureBuilder<int>(
//                   future: _hydrationTarget,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else {
//                       final hydrationTarget = snapshot.data!;
//                       return Text(
//                         'Daily Hydration Goal: $hydrationTarget ml',
//                         style: Theme.of(context).textTheme.titleLarge,
//                       );
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 FutureBuilder<List<HydrationEntry>>(
//                   future: _hydrationEntries,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else {
//                       final hydrationEntries = snapshot.data!;
//                       if (hydrationEntries.isEmpty) {
//                         return const Center(
//                           child: Text('No Hydration Entries'),
//                         );
//                       }
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             'Recent Hydration Entries',
//                             style: Theme.of(context).textTheme.titleLarge,
//                           ),
//                           const SizedBox(height: 8.0),
//                           for (final entry in hydrationEntries.take(5))
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 8.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   Text(_dateFormat.format(entry.date)),
//                                   Text(
//                                     '${entry.hydration.amount.toStringAsFixed(0)} ml',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           if (hydrationEntries.length > 5)
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pushNamed(
//                                   context,
//                                   '/hydration-list',
//                                   arguments: {
//                                     'hydrationEntries': hydrationEntries
//                                   },
//                                 );
//                               },
//                               child: const Text('View All'),
//                             ),
//                         ],
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/add-hydration');
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
