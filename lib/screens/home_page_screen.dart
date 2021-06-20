import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/common/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Dashboard',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                height: 3,
                fontWeight: FontWeight.bold,
                fontSize: 18.0
              )
            ),
          ) 
        ),
      ),
      body: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}


class _HomeWidgetState extends State<HomeWidget> {
  DateTime _date = DateTime.now();
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = _dateFormatter.format(_date);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 393,
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Current Balance

              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  padding: EdgeInsets.all(7.0),
                  width: 350,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorConstants.korangeColor,
                            ColorConstants.kpurplecolor,
                            ColorConstants.kindigocolor
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(215, 69, 200, 0.6),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: Offset(0, 4.0), // changes position of shadow
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${_dateFormatter.format(_date)}',
                            style: GoogleFonts.poppins(  
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0
                              ),
                            )
                          ),
                          Text(
                            'Rp.20.000.000',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                height: 1.1,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                            ) 
                          ),
                          Text(
                            'current balance',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                height: 1.2,
                                fontSize: 12.0),
                            )
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          height: 100,
                          width: 80,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset(
                                'assets/images/boy.jpg', 
                                width: 50, 
                                height: 50,
                                fit: BoxFit.cover,
                                )
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text( 
                                  'Boy William',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      height: 1.2,
                                      fontSize: 13.0),
                                  )
                                ),
                              )
                            ]),
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Recent Activities',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                  )
                ),
              ),

              //Recent Activities

              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  margin: EdgeInsets.only(bottom: 20),
                  width: 350,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: 310,
                        height: 38,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(7),
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    FontAwesomeIcons.film,
                                    size: 14,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(100, 224, 61, 191),
                                      borderRadius: BorderRadius.circular(90)),
                                ),
                                Text(
                                  'Entertainment',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black, fontSize: 13.0),
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Text(
                              'Rp.150.000',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 252, 89, 173),
                                      fontSize: 13.0),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: 310,
                        height: 38,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(7),
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    FontAwesomeIcons.film,
                                    size: 14,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(100, 61, 224, 224),
                                      borderRadius: BorderRadius.circular(90)),
                                ),
                                Text(
                                  'Active Income',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black, fontSize: 13.0),
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Text(
                              'Rp.70.000',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 97, 215, 68),
                                      fontSize: 13.0),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: 310,
                        height: 38,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(7),
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    FontAwesomeIcons.film,
                                    size: 14,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(100, 38, 3, 255),
                                      borderRadius: BorderRadius.circular(90)),
                                ),
                                Text(
                                  'Passive Income',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black, fontSize: 13.0),
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Text(
                              'Rp.80.000',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 97, 215, 68),
                                      fontSize: 13.0),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Graph

              Center(
                  child: Container(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                margin: EdgeInsets.only(bottom: 20),
                width: 350,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                    // children: [
                    //   PieChart(
                    //     PieChartData(
                    //       sections: _sections,
                    //       borderData: FlBorderData(show: false),
                    //       centerSpaceRadius: 60,
                    //       sectionsSpace: 0,
                    //     )
                    //   )
                    // ],
                    ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
