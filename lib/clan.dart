import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'loading.dart';
import 'package:transparent_image/transparent_image.dart';
/// Calls clan screen.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreen();
}
/// Displays clan information.
class _HomeScreen extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/sword.jpg',
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
                          Text(clan.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                  fontWeight: FontWeight.w400
                              )),
                          const Divider(
                            height: 20,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.orange,
                          ),
                          Text('(${clan.tag})',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                  fontWeight: FontWeight.w400
                              )),
                          const Divider(
                            height: 20,
                            thickness: 1,
                            indent: 50,
                            endIndent: 0,
                            color: Colors.orange,
                          ),
                          Text(clan.location,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400
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
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          Text(clan.warWins.toString(),
                              style: const TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 50,
                                fontWeight: FontWeight.w800,
                              )),
                          const Text('WINS',
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
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          Text(clan.warTies.toString(),
                              style: const TextStyle(
                                color: Color.fromRGBO(235, 213, 52, 1),
                                fontSize: 50,
                                fontWeight: FontWeight.w800,
                              )),
                          const Text('DRAWS'),
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
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          Text(clan.warLosses.toString(),
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 50,
                                fontWeight: FontWeight.w800,
                              )),
                          const Text('LOSSES'),
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
                  'CLAN INFO',
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
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: clan.badgeUrl,
                    ),
                    Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 0),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Text(clan.description,
                                    textAlign:  TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
