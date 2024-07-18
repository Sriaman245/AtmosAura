import 'dart:math';
import 'package:project_weather_app/workers.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => homeScreenState();
}

class homeScreenState extends State<homeScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var arrLoc = [
      'Lucknow',
      'Delhi',
      'Mumbai',
      'Kolkata',
      'Chennai',
      'Bengaluru'
    ];
    final _random = new Random();
    var location = arrLoc[_random.nextInt(arrLoc.length)];
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 25, 0, 50),
              const Color.fromARGB(255, 134, 28, 240),
              const Color.fromARGB(255, 79, 26, 120),
              Color(0xff330867)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                margin: EdgeInsets.only(top: 25),
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 127, 81, 255),
                      const Color.fromARGB(255, 201, 153, 255)
                    ],
                    begin: Alignment.topLeft,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color:const Color.fromARGB(255, 20, 4, 54),fontWeight: FontWeight.bold),
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: 'Search ${location}',
                            border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          if (searchController.text.replaceAll(" ", "") == "") {
                            print("Blank Search");
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loading(),
                                    settings: RouteSettings(
                                      arguments: {
                                        'searchText':
                                            searchController.text.toString(),
                                      },
                                    )));
                          }
                        },
                        child: Icon(
                          Icons.search,
                          color: const Color.fromARGB(255, 30, 21, 51),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 127, 81, 255),
                        const Color.fromARGB(255, 201, 153, 255)
                      ],
                      begin: Alignment.topLeft,
                    ),
                    // color: const Color.fromARGB(255, 168, 216, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image.network(
                          'https://openweathermap.org/img/wn/${info?['icon_value']}@2x.png',
                          height: 70.0,
                          width: 70.0),
                      SizedBox(width: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${info?['desc_value']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text("in ${info?['loc_value']}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                    ],
                  ),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 280,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 35, 16, 89),
                      const Color.fromARGB(255, 45, 16, 79)
                    ], begin: Alignment.topLeft),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        WeatherIcons.thermometer,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${info?['temp_value']}",
                              style: TextStyle(
                                  fontSize: 130, color: Colors.white)),
                          Text("°C",
                              style:
                                  TextStyle(fontSize: 45, color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 35, 16, 89),
                            const Color.fromARGB(255, 45, 16, 79)
                          ],
                        ),
                        // color: const Color.fromARGB(255, 168, 216, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.day_windy, color: Colors.white),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text("${info?['speed_value']}",
                              style: TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text("Km/hr",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 35, 16, 89),
                            const Color.fromARGB(255, 45, 16, 79)
                          ],
                        ),
                        // color: const Color.fromARGB(255, 168, 216, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                WeatherIcons.humidity,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text("${info?['humid_value']}",
                              style: TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text("Percent",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  "Data Provided By Openweathermap.org",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Text(
                  "Made by Aman Sahi",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
