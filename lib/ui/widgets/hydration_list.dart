import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watintake/models/hydration_entry.dart';

class HydrationList extends StatelessWidget {
  final List<HydrationEntry> entries;
  final void Function(HydrationEntry entry) onEntryDeleted;

  const HydrationList({super.key, 
    required this.entries,
    required this.onEntryDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return Dismissible(
          key: ValueKey(entry.id),
          onDismissed: (_) => onEntryDeleted(entry),
          child: Card(
            child: ListTile(
              title: Text('${entry.hydration.amount}ml of water'),
              subtitle: Text(entry.displayDate),
              trailing: Text(DateFormat.jm().format(entry.date)),
            ),
          ),
        );
      },
    );
  }
}
