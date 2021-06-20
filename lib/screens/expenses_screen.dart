import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/common/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/db/dbExpenses_helper.dart';
import 'package:my_app/models/expenses_models.dart';

class ExpensesScreen extends StatefulWidget {
  ExpensesScreen({Key key}) : super(key: key);

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  Color color = ColorConstants.gblackColor;
  Color fcolor = ColorConstants.kgreyColor;
  int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'Expenses List',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  height: 3,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)),
        )),
        // actions: [
        //   Container(
        //     child: Icon(
        //       Icons.menu,
        //       size: 30,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: ExpensesWidget(),
    );
  }
}

class ExpensesWidget extends StatefulWidget {
  ExpensesWidget({Key key}) : super(key: key);

  @override
  _ExpensesWidgetState createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<ExpensesWidget> {
  Future<List<Expenses>> _expensesList;
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    _updateExpensesList();
  }

  _updateExpensesList() {
    setState(() {
      _expensesList = DbExpenses.instance.getExpensesList();
    });
  }

  Widget _buildExpenses(Expenses expenses) {
    return Column(
      children: [
        ListBody(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              padding: EdgeInsets.only(left: 20, right: 20),
              width: 400,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'Rp.${expenses.nominal}\t\t',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 252, 89, 173),
                                  fontSize: 16.0),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        '${expenses.nama}',
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Text(
                    '${_dateFormatter.format(expenses.date)}',
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 16.0),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
          // title: Text(expenses.nama),
          // subtitle: Text(
          //   '${_dateFormatter.format(expenses.date)} - ${expenses.jenis}',
          //   style: TextStyle(
          //     fontSize: 15,
          //   ),
          // ),
          // trailing: Checkbox(
          //   onChanged: (value) {
          //     // task.status = value ? 1 : 0;
          //     // DbExpenses.instance.updateExpenses(task);
          //     // _updateExpensesList();
          //   },
          //   activeColor: Theme.of(context).primaryColor,
          //   value: true,
          // ),
          // onTap: () => Navigator.push(
          //   context, MaterialPageRoute(
          //     builder: (_) => AddDataScreen(
          //       updateExpensesList: _updateExpensesList(),
          //       expenses: expenses,
          //     )
          //   )
          // ),
        ),
      ],
    );
  }

  bool isActive = false;
  int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _expensesList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              // final int completedTaskCount = snapshot.data
              //     .where((Task task) => task.status == 1)
              //     .toList()
              //     .length;

              return ListView.builder(
                itemCount: 1 + snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Container();
                  }
                  return _buildExpenses(snapshot.data[index - 1]);
                },
              );
            }));
  }
}
