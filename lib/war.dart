import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'loading.dart';
/// Displays war information.
class War extends StatelessWidget {
  const War({super.key, required this.index});
  final int index;
  /// Checks if result is null.
  fillResult(index) {
    if (log[index].result == null) {
      return 'unknown';
    }
    return log[index].result;
  }
  /// Checks if opponent's tag is null.
  fillTag(index) {
    if (log[index].oppTag == null) {
      return 'unknown';
    }
    return log[index].oppTag;
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
    String result = fillResult(index);
    String oppName = fillName(index);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.orange,
        title: const Text('War'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/archer.jpg',
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
                          vertical: 30, horizontal: 20),
                      child: Column(
                        children: [
                          Text('${log[index].clanName} vs $oppName',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400)),
                          const Divider(
                            height: 20,
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: log[index].clanBadgeUrl,
                    ),
                    // const Text('VS',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 5,
                    //       fontWeight: FontWeight.w400,
                    //     )),
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: log[index].oppBadgeUrl,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'RESULTS',
                      style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    height: 250,
                    child: CarouselSlider(
                      items: [
                        Container(
                          width: 350,
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    Text('Result: ${getResult(result)}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                        )),
                                    const Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 50,
                                      endIndent: 50,
                                      color: Colors.orange,
                                    ),
                                    Text('Team Size: ${log[index].teamSize}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                        )),
                                    const Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 50,
                                      endIndent: 50,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                        'End: ${getTime(log[index].endTime, index)}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text('Clan Attack: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                )),
                                            Text('${log[index].clanAttack}',
                                                style: const TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 30,
                                                )),
                                          ]),
                                      const Divider(
                                        height: 20,
                                        thickness: 1,
                                        indent: 50,
                                        endIndent: 50,
                                        color: Colors.orange,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text('Total Stars: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                )),
                                            Text('${log[index].clanStar}',
                                                style: const TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 30,
                                                )),
                                          ]),
                                      const Divider(
                                        height: 20,
                                        thickness: 1,
                                        indent: 50,
                                        endIndent: 50,
                                        color: Colors.orange,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text('Destroyed: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                )),
                                            Text(
                                                '${log[index].clanDestructionPercentage.toStringAsFixed(2)}%',
                                                style: const TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 30,
                                                )),
                                          ])
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          width: 350,
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Opponent',
                                          style: TextStyle(
                                                    color: Colors.black,
                                                     fontSize: 30,
                                                   )),
                                      const Divider(
                                        height: 20,
                                        thickness: 1,
                                        indent: 50,
                                        endIndent: 50,
                                        color: Colors.orange,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text('Total Stars: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                )),
                                            Text('${log[index].oppStar}',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 30,
                                                )),
                                          ]),
                                      const Divider(
                                        height: 20,
                                        thickness: 1,
                                        indent: 50,
                                        endIndent: 50,
                                        color: Colors.orange,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text('Destroyed: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                )),
                                            Text(
                                                '${log[index].oppDestructionPercentage.toStringAsFixed(2)}%',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 30,
                                                )),
                                          ])
                                    ],
                                  ),
                                )),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/// Converts time to YYYY/MM/DD
getTime(endTime, index) {
  String temp = '';
  for (int i = 0; i < 8; i++) {
    if (i == 3 || i == 5) {
      temp += endTime[i] + '/';
    } else {
      temp += endTime[i];
    }
  }
  return temp;
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
