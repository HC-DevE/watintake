// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:watintake/services/recommendation_service.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 32),
//               const Text(
//                 "Welcome back,",
//                 style: TextStyle(fontSize: 20),
//               ),
//               const SizedBox(height: 4),
//               const Text(
//                 "User Name",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 32),
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         Icon(Icons.local_drink),
//                         SizedBox(height: 8),
//                         Text(
//                           "Hydration",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text("1000 ml"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Icon(Icons.directions_run),
//                         SizedBox(height: 8),
//                         Text(
//                           "Activity",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text("60 min"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Icon(Icons.local_cafe),
//                         SizedBox(height: 8),
//                         Text(
//                           "Caffeine",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text("0 mg"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 32),
//               Text(
//                 "Daily Goal",
//                 style: TextStyle(fontSize: 20),
//               ),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         "Hydration",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text("2000 ml"),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         "Activity",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text("120 min"),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         "Caffeine",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text("500 mg"),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: () async {
//                   var url = Uri.parse('https://www.fitbit.com/oauth2/authorize');
//                   var response = await http.get(url);
//                   print('Response status: ${response.statusCode}');
//                   print('Response body: ${response.body}');
//                 },
//                 child: Text("Start Workout"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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

//3rd
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );
//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.5),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _currentTab = 0;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Water Tracker'),
//         ),
//         body: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height / 3,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.blue.shade200, Colors.blue.shade400],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: const Radius.circular(40),
//                   bottomRight: const Radius.circular(40),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text(
//                     'Stay Hydrated',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Set your daily hydration goal and track your progress',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 32),
//             SlideTransition(
//               position: _offsetAnimation,
//               child: const Text(
//                 'Daily Hydration Goal',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             SlideTransition(
//               position: _offsetAnimation,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter your goal',
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: const Text('Set'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 32),
//             FadeTransition(
//               opacity: _controller,
//               child: const Text(
//                 'Track Your Progress',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             FadeTransition(
//               opacity: _controller,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           hintText: 'Enter amount',
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: const Text('Add'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             FadeTransition(
//               opacity: _controller,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: LinearProgressIndicator(
//                         value: 0.7,
//                         valueColor:
//                             AlwaysStoppedAnimation<Color>(Colors.blue.shade300),
//                         backgroundColor: Colors.grey.shade300,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Text(
//                       '70%',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             BottomNavigationBar(
//               currentIndex: _currentTab,
//               onTap: (int index) {
//                 setState(() {
//                   _currentTab = index;
//                 });
//               },
//               items: const [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.person),
//                   label: 'Profile',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.settings),
//                   label: 'Settings',
//                 ),
//               ],
//             ),
//           ],
//         ),

//       ),
//     );
//   }
// }

//4th

import 'package:flutter/material.dart';
import 'package:watintake/ui/pages/hydration_page.dart';
import 'package:watintake/ui/pages/profile_page.dart';
import 'recommendations_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(40),
                bottomRight: const Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Stay Hydrated',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Set your daily hydration goal and track your progress',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          SlideTransition(
            position: _offsetAnimation,
            child: const Text(
              'Daily Hydration Goal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SlideTransition(
            position: _offsetAnimation,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your goal',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Set'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          FadeTransition(
            opacity: _controller,
            child: const Text(
              'Track Your Progress',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          FadeTransition(
            opacity: _controller,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Current intake',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HydrationPage()),
                  );
                },
                icon: const Icon(Icons.local_drink),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RecommendationsPage(user: null,)),
                  );
                },
                icon: const Icon(Icons.stacked_bar_chart),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
                icon: const Icon(Icons.person),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()),
                  );
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
