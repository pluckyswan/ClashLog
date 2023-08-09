import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'loading.dart';
/// Displays individual member information.
class Member extends StatelessWidget {
  const Member({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.orange,
        title: const Text('Member'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bomber.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
              child: Column(
            children: [
              Container(
                width: 500,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                //margin: const EdgeInsets.all(30),
                child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          Text(clan.memberList[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              )),
                          const Divider(
                            height: 20,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.orange,
                          ),
                          Text(clan.memberList[index].tag,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                          const Divider(
                            height: 20,
                            thickness: 1,
                            indent: 50,
                            endIndent: 0,
                            color: Colors.orange,
                          ),
                          Text(clan.memberList[index].role,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                        ],
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 120,
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          Text(clan.memberList[index].donated.toString(),
                              style: const TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 50,
                                fontWeight: FontWeight.w800,
                              )),
                          const Text('DONATED',
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 120,
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          Text(clan.memberList[index].donation.toString(),
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 50,
                                fontWeight: FontWeight.w800,
                              )),
                          const Text('RECEIVED'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 50,
                thickness: 5,
                indent: 50,
                endIndent: 50,
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'MEMBER INFO',
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Expanded(
                child: CarouselSlider(
                  items: [
                    if (clan.memberList[index].leagueIcon == null)
                        FittedBox(fit: BoxFit.fill,child:
                        FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: clan.memberList[index].leagueIconSmall,
                        ),
                        ),
                    if (clan.memberList[index].leagueIcon != null)
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: clan.memberList[index].leagueIcon,
                      ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 40, horizontal: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: DataTable(
                            headingRowColor: MaterialStateProperty.resolveWith(
                                (states) => const Color.fromRGBO(252, 249, 199, 1)),
                            columns: const [
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Trophies',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Rank',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            rows: [
                              DataRow(
                                color: MaterialStateProperty.resolveWith(
                                    (states) => Colors.white),
                                cells: <DataCell>[
                                  DataCell(Text(
                                    '${clan.memberList[index].trophy}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                                  DataCell(
                                      Text('${clan.memberList[index].clanRank}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ))),
                                ],
                              ),
                            ])),
                  ],
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
