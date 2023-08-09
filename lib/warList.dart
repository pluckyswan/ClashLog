import 'package:clash_log/sword_con_icons.dart';
import 'package:flutter/material.dart';
import 'loading.dart';
import 'war.dart';
/// Calls list screen.
class WarList extends StatefulWidget {
  const WarList({super.key});
  @override
  State<StatefulWidget> createState() => _WarList();

}
/// Displays list of wars.
class _WarList extends State<WarList> {
  /// Checks if result is null.
  fillResult(index) {
    if (log[index].result == null) {
      return 'unknown';
    }
    return log[index].result;
  }
  /// Checks if opponent's name is null.
  fillName(index) {
    if (log[index].oppName == null) {
      return 'unknown';
    }
    return log[index].oppName;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: log.length,
          itemBuilder: (BuildContext context, int index) {
            String result = fillResult(index);
            String oppName = fillName(index);
            return Card(
              child: ListTile(
                leading: const Icon(
                  SwordCon.broadsword,
                ),
                title: Text(
                  '${log[index].clanName} vs ${oppName}',
                ),
                subtitle: Text(
                  getResult(result),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => War(index: index),
                  ),
                  );
                },
              ),
            );
          }
      ),
    );
  }
}

/// Returns clan result in proper phrasing.
getResult(result) {
  if (result == 'win') {
    return 'Win';
  }
  if (result == 'lose') {
    return 'Loss';
  }
  return 'Tied';
}
