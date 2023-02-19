// import 'package:flutter/material.dart';
// import '../../models/user.dart';
// import '../../services/hydration_service.dart';

// class RecommendationsPage extends StatefulWidget {
//   final User user;

//   const RecommendationsPage({Key? key, required this.user}) : super(key: key);

//   @override
//   _RecommendationsPageState createState() => _RecommendationsPageState();
// }

// class _RecommendationsPageState extends State<RecommendationsPage> {
//   late HydrationService _hydrationService;

//   @override
//   void initState() {
//     super.initState();
//     _hydrationService = HydrationService(user: widget.user);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Recommendations'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Hydration Goal',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             Text(
//               '${_hydrationService.getHydrationGoal()} ml',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Hydration Chart',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             HydrationChart(hydrationEntries: _hydrationService.getHydrationEntries()),
//           ],
//         ),
//       ),
//     );
//   }
// }

//2nd method

// import 'package:flutter/material.dart';

// import '../../models/user.dart';
// import '../../services/hydration_service.dart';
// import '../widgets/hydration_chart.dart';

// class RecommendationsPage extends StatefulWidget {
//   final User user;

//   const RecommendationsPage({Key? key, required this.user}) : super(key: key);

//   @override
//   _RecommendationsPageState createState() => _RecommendationsPageState();
// }

// class _RecommendationsPageState extends State<RecommendationsPage> {
//   late HydrationService _hydrationService;

//   @override
//   void initState() {
//     super.initState();
//     _hydrationService = HydrationService(user: widget.user);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Recommendations'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Hydration Goal',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             Text(
//               '${_hydrationService.getHydrationGoal()} ml',
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Hydration Chart',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             HydrationChart(hydrationEntries: _hydrationService.getHydrationEntries()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 3rd

// import 'package:flutter/material.dart';
// import 'package:watintake/models/user.dart';
// import 'package:watintake/services/hydration_service.dart';
// import 'package:watintake/ui/widgets/hydration_chart.dart';

// class RecommendationsPage extends StatefulWidget {
//   final User user;

//   const RecommendationsPage({Key? key, required this.user}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _RecommendationsPageState createState() => _RecommendationsPageState();
// }

// class _RecommendationsPageState extends State<RecommendationsPage> {
//   late HydrationService _hydrationService;

//   @override
//   void initState() {
//     super.initState();
//     _hydrationService = HydrationService(user: widget.user);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Recommendations'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Hydration Goal',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             Text(
//               '${_hydrationService.getHydrationGoal()} ml',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Hydration Chart',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             HydrationChart(hydrationEntries: _hydrationService.getHydrationEntries()),
//           ],
//         ),
//       ),
//     );
//   }
// }

//3rd one

// import 'package:flutter/material.dart';
// import 'package:watintake/models/user.dart';
// import 'package:watintake/services/hydration_service.dart';
// import 'package:watintake/ui/widgets/hydration_chart.dart';

// import '../../models/hydration_entry.dart';

// class RecommendationsPage extends StatefulWidget {
//   final User user;

//   const RecommendationsPage({Key? key, required this.user}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _RecommendationsPageState createState() => _RecommendationsPageState();
// }

// class _RecommendationsPageState extends State<RecommendationsPage> {
//   late HydrationService _hydrationService;

//   @override
//   void initState() {
//     super.initState();
//     _hydrationService = HydrationService(user: widget.user);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Recommendations'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Hydration Goal',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             FutureBuilder<int>(
//               future: _hydrationService.getHydrationGoal(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Text(
//                     '${snapshot.data} ml',
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   return const CircularProgressIndicator();
//                 }
//               },
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Hydration Chart',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             FutureBuilder<List<HydrationEntry>>(
//               future: _hydrationService.getHydrationEntries(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return HydrationChart(hydrationEntries: snapshot.data!);
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   return const CircularProgressIndicator();
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//4th one
import 'package:flutter/material.dart';
import 'package:watintake/models/user.dart';
import 'package:watintake/services/hydration_service.dart';
import 'package:watintake/ui/widgets/hydration_chart.dart';

import '../../models/hydration_entry.dart';

class RecommendationsPage extends StatefulWidget {
  final User? user;

  const RecommendationsPage({Key? key, required this.user}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RecommendationsPageState createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  late HydrationService _hydrationService;
  int? _hydrationGoal;

  @override
  void initState() {
    super.initState();
    _hydrationService = HydrationService(user: widget.user);
    _loadHydrationGoal();
  }

  Future<void> _loadHydrationGoal() async {
    final hydrationGoal = _hydrationService.getHydrationGoal();
    setState(() {
      _hydrationGoal = hydrationGoal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hydration Goal',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _hydrationGoal != null
                ? Text(
                    '${_hydrationGoal!} ml',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              'Hydration Chart',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            FutureBuilder<List<HydrationEntry>>(
              future: _hydrationService.getHydrationEntries(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final hydrationEntries = snapshot.data ?? <HydrationEntry>[];
                return HydrationChart(hydrationEntries: hydrationEntries);
              },
            ),
            ListView(
              padding: const EdgeInsets.all(16),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Tips for staying hydrated:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  '1. Carry a reusable water bottle with you and drink from it throughout the day.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  '2. Flavor your water with fresh fruit or herbs to make it more enjoyable to drink.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  '3. Eat water-rich foods like watermelon, cucumbers, and tomatoes.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  '4. Set reminders to drink water throughout the day.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Foods that can help you stay hydrated:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // ignore: prefer_const_constructors
                const ListTile(
                  leading: Text('fruits'),
                  title: Text('Fruits'),
                  // ignore: unnecessary_const
                  subtitle: const Text(
                      'Watermelon, strawberries, oranges, and grapefruits'),
                ),
                const SizedBox(height: 16),
                const ListTile(
                  leading: Text('vegetables'),
                  title: Text('Vegetables'),
                  subtitle: Text('Cucumbers, lettuce, celery, and tomatoes'),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Existing hydration goal code
                // Existing "Hydration Chart" text
                // FutureBuilder to display hydration chart
                FutureBuilder<List<HydrationEntry>>(
                  future: _hydrationService.getHydrationEntries(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final hydrationEntries =
                        snapshot.data ?? <HydrationEntry>[];
                    return HydrationChart(hydrationEntries: hydrationEntries);
                  },
                ),
                // Existing tips and foods for staying hydrated code
              ],
            )
          ],
        ),
      ),
    );
  }
}
