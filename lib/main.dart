import 'package:clash_log/sword_con_icons.dart';
import 'package:flutter/material.dart';
import 'loading.dart';
import 'navigation.dart';
// EXAMPLE TAG: YYR2JRYJ
/// Holds routes between start screen and bottom navigation handler.
void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => const Start(),
    '/home': (context) => const Navigation(),
  }));
}

/// Calls start screen.
class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartScreen();
}

/// Awaits user to enter valid clan tag.
class _StartScreen extends State<Start> {
  final _clanTagKey = GlobalKey<FormState>();
  bool acknowledge = false;
  final myController = TextEditingController();
  bool exist = false;
  bool ready = false;

  /// Disposes controller when done.
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  /// Checks if user 'OKed' pop-up.
  void _understood() {
    setState(() {
      acknowledge = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Clan does not exist'),
      duration: Duration(seconds: 5),
    );
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
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/welcome_screen.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!acknowledge)
                  AlertDialog(
                    icon: const Icon(Icons.warning_amber),
                    title: const Text('Disclaimer'),
                    content: const Text(
                        'This content is not affiliated with, endorsed, sponsored, or specifically approved by Supercell and Supercell is not responsible for it. For more information see Supercell’s Fan Content Policy: www.supercell.com/fan-content-policy.'),
                    actions: [
                      TextButton(
                        onPressed: () => _understood(),
                        child: const Text(
                          'Understood!',
                        ),
                      ),
                    ],
                  ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.yellow,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.yellow,
                          Colors.yellow,
                          Colors.yellowAccent,
                          Colors.yellowAccent,
                          Colors.yellowAccent,
                          Colors.yellowAccent,
                          Colors.yellowAccent,
                          Colors.yellow,
                          Colors.yellow
                        ],
                      )),
                  child: const Text(
                    'ENTER A CLAN TAG',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Form(
                    key: _clanTagKey,
                    child: TextFormField(
                        controller: myController,
                        autovalidateMode: AutovalidateMode.always,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Tag must be entered';
                          } else if (value.contains('#')) {
                            return 'Do not include #';
                          } else if (value.length < 3) {
                            return 'Tag must be at least 3 characters';
                          } else if (value.length > 9) {
                            return 'Tag must be less than 9 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.tag, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Clan Tag',
                          hintText: 'YYR2JRYJ',
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            backgroundColor: Colors.white,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () async {
                        exist = false;
                        ready = false;
                        if (_clanTagKey.currentState!.validate()) {
                          while (!ready) {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const Dialog(
                                      child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(90, 60, 90, 60),
                                    child: CircularProgressIndicator(),
                                  ));
                                });
                            exist = await fetchClanClass(myController.text);
                            ready = true;
                          }
                          if (exist) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            await Future.delayed(const Duration(seconds: 4));
                            Navigator.pushNamed(context, '/home');
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        elevation: 4.5,
                        shadowColor: Colors.brown,
                      ),
                      child: const Text(
                        'Go!',
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
