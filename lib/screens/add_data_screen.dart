
import '/common/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'input_expenses_part.dart';
import 'input_incomes_part.dart';

enum WidgetMarker { inputExpenses, inputIncomes }

class AddDataScreen extends StatefulWidget {
  AddDataScreen({Key key}) : super(key: key);

  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  bool isActive = false;
  int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'Insert Data',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  height: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)),
        )),
      ),
      body: AddDataPage(),
    );
  }
}

class AddDataPage extends StatefulWidget {
  @override
  _AddDataPageState createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage>
    with SingleTickerProviderStateMixin {
  WidgetMarker selectedWidgetMarker = WidgetMarker.inputExpenses;

  AnimationController _controller;
  Animation <double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
                //inputExpenses
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, right: 5.0),
                            // padding: EdgeInsets.all(7.0),
                            width: 160,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      (selectedWidgetMarker ==
                                              WidgetMarker.inputExpenses)
                                          ? ColorConstants.korangeColor
                                          : Colors.white,
                                      (selectedWidgetMarker ==
                                              WidgetMarker.inputExpenses)
                                          ? ColorConstants.kpurplecolor
                                          : Colors.white,
                                      (selectedWidgetMarker ==
                                              WidgetMarker.inputExpenses)
                                          ? ColorConstants.kindigocolor
                                          : Colors.white
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(215, 69, 200, 0.6),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 4.0), // changes position of shadow
                                  ),
                                ]),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(
                                      color: Color.fromRGBO(0, 160, 227, 0))),
                              onPressed: () {
                                setState(() {
                                  selectedWidgetMarker = WidgetMarker.inputExpenses;
                                });
                              },
                              padding: EdgeInsets.all(10.0),
                              color: Color.fromRGBO(0, 160, 227, 0),
                              textColor: Colors.white,
                              child: Text(
                                'Insert Expenses',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: (selectedWidgetMarker ==
                                            WidgetMarker.inputExpenses)
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 5.0),
                            // padding: EdgeInsets.all(7.0),
                            width: 160,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      (selectedWidgetMarker ==
                                              WidgetMarker.inputIncomes)
                                          ? ColorConstants.korangeColor
                                          : Colors.white,
                                      (selectedWidgetMarker ==
                                              WidgetMarker.inputIncomes)
                                          ? ColorConstants.kpurplecolor
                                          : Colors.white,
                                      (selectedWidgetMarker ==
                                              WidgetMarker.inputIncomes)
                                          ? ColorConstants.kindigocolor
                                          : Colors.white
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(215, 69, 200, 0.6),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 4.0), // changes position of shadow
                                  ),
                                ]),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(
                                      color: Color.fromRGBO(0, 160, 227, 0))),
                              onPressed: () {
                                setState(() {
                                  selectedWidgetMarker = WidgetMarker.inputIncomes;
                                });
                              },
                              padding: EdgeInsets.all(10.0),
                              color: Color.fromRGBO(0, 160, 227, 0),
                              textColor: Colors.white,
                              child: Text(
                                'Insert Incomes',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: (selectedWidgetMarker ==
                                            WidgetMarker.inputIncomes)
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder(
                        future: _playAnimation(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          return getCustomContainer();
                        },
                      )
                    ],
                  ),
                ),
                //Graph
              ],
            ),
          ),
        ),
    );
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.inputExpenses:
        return getinputExpensesContainer();
      case WidgetMarker.inputIncomes:
        return getinputIncomesContainer();
    }
    // return getinputExpensesContainer();
  }

  Widget getinputExpensesContainer() {
    return InputExpensesPart(
      animation: _animation,
    );
  }

  Widget getinputIncomesContainer() {
    return InputIncomesPart(
      animation: _animation,
    );
  }
}


