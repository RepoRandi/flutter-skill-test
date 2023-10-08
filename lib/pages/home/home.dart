import 'package:flutter/material.dart';
import 'package:skill_test/pages/profile/profile.dart';
import 'package:skill_test/pages/soal_a/soal_a.dart';
import 'package:skill_test/pages/soal_b/soal_b.dart';
import 'package:skill_test/pages/soal_c/soal_c.dart';
import 'package:skill_test/pages/soal_d/soal_d.dart';
import 'package:skill_test/pages/soal_e/soal_e.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill Test'),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraint) {
                  List menus = [
                    {
                      "icon": "A",
                      "label": "Soal A",
                      "isText": true,
                      "onTap": () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SoalA()),
                          ),
                    },
                    {
                      "icon": "B",
                      "label": "Soal B",
                      "isText": true,
                      "onTap": () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SoalB()),
                          ),
                    },
                    {
                      "icon": "C",
                      "label": "Soal C",
                      "isText": true,
                      "onTap": () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SoalC()),
                          ),
                    },
                    {
                      "icon": "D",
                      "label": "Soal D",
                      "isText": true,
                      "onTap": () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SoalD()),
                          ),
                    },
                    {
                      "icon": "E",
                      "label": "Soal E",
                      "isText": true,
                      "onTap": () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SoalE()),
                          ),
                    },
                    {
                      "icon": Icons.person,
                      "label": "Profile",
                      "onTap": () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
                          ),
                    },
                  ];

                  return Wrap(
                    children: List.generate(
                      menus.length,
                      (index) {
                        var item = menus[index];

                        var size = constraint.biggest.width / 2;

                        return SizedBox(
                          width: size,
                          height: size,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blueGrey,
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              backgroundColor: Colors.transparent,
                              splashFactory: InkSplash.splashFactory,
                              shadowColor: Colors.transparent,
                              elevation: 0.0,
                            ),
                            onPressed: () => item["onTap"](),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                item["isText"] == true
                                    ? Text(
                                        item["icon"],
                                        style: const TextStyle(
                                          fontSize: 50,
                                          color: Colors.deepPurple,
                                        ),
                                      )
                                    : Icon(
                                        item["icon"],
                                        size: 50,
                                        color: Colors.deepPurple,
                                      ),
                                item["isText"] == true
                                    ? const SizedBox(
                                        height: 5.0,
                                      )
                                    : const SizedBox(
                                        height: 20.0,
                                      ),
                                Text(
                                  "${item["label"]}",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
