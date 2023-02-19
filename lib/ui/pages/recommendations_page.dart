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
  final User user;

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
          ],
        ),
      ),
    );
  }
}


