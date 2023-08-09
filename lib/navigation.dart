import 'package:clash_log/sword_con_icons.dart';
import 'package:clash_log/warList.dart';
import 'package:flutter/material.dart';
import 'clan.dart';
import 'main.dart';
import 'memberList.dart';
/// Calls navigation.
class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<StatefulWidget> createState() => _Navigation();
}
/// Calls navigation bar.
class _Navigation extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ClashLog',
      home: NavBar(),
    );
  }
}
/// Calls navigation bar builder.
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<StatefulWidget> createState() => _NavBar();
}
/// Controls bottom naviagtion information.
class _NavBar extends State<NavBar> {
  int pageIndex = 0;
  final pages = [
    const Home(),
    const MemberList(), const WarList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'ClashLog',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
        leading: const Icon(
          SwordCon.shield_alt,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Start())
            );
          },
              icon: const Icon(Icons.exit_to_app_sharp),
          ),
        ],
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildNavBar(context),
    );
  }
  Container buildNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.orange,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.other_houses_sharp,
                    color: Colors.white,
                    size: 25,
                  )
                : const Icon(
              Icons.other_houses_sharp,
                    color: Colors.brown,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.person_sharp,
                    color: Colors.white,
                    size: 25,
                  )
                : const Icon(
              Icons.person_sharp,
                    color: Colors.brown,
                    size: 25,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              SwordCon.broadsword,
                    color: Colors.white,
                    size: 25,
                  )
                : const Icon(
              SwordCon.broadsword,
                    color: Colors.brown,
                    size: 25,
                  ),
          ),
        ],
      ),
    );
  }
}
