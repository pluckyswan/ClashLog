import 'package:flutter/material.dart';
import 'loading.dart';
import 'member.dart';
/// Calls member list.
class MemberList extends StatefulWidget {
  const MemberList({super.key});

  @override
  State<StatefulWidget> createState() => _MemberList();
}
/// Displays list of members in clan.
class _MemberList extends State<MemberList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: clan.members,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: Text(
                    clan.memberList[index].name,
                  ),
                  subtitle: Text(
                    clan.memberList[index].tag,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Member(index: index),
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
