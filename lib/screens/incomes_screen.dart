import '/common/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/db/dbIncomes_helper.dart';
import 'package:my_app/models/incomes_models.dart';

class IncomesScreen extends StatefulWidget {
  IncomesScreen({Key key}) : super(key: key);

  @override
  _IncomesScreenState createState() => _IncomesScreenState();
}

class _IncomesScreenState extends State<IncomesScreen> {
  int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'Incomes List',
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
      body: IncomesWidget(),
    );
  }
}

class IncomesWidget extends StatefulWidget {
  IncomesWidget({Key key}) : super(key: key);

  @override
  _IncomesWidgetState createState() => _IncomesWidgetState();
}

class _IncomesWidgetState extends State<IncomesWidget> {
  Future<List<Incomes>> _incomesList;
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    _updateIncomesList();
  }

  _updateIncomesList() {
    setState(() {
      _incomesList = DbIncomes.instance.getIncomesList();
    });
  }

  Widget _buildIncomes(Incomes incomes) {
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
                          'Rp.${incomes.nominal}\t\t',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: ColorConstants.kgreencolor,
                                  fontSize: 16.0),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        '${incomes.nama}',
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Text(
                    '${_dateFormatter.format(incomes.date)}',
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 16.0),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
          // title: Text(incomes.nama),
          // subtitle: Text(
          //   '${_dateFormatter.format(incomes.date)} - ${incomes.jenis}',
          //   style: TextStyle(
          //     fontSize: 15,
          //   ),
          // ),
          // trailing: Checkbox(
          //   onChanged: (value) {
          //     // task.status = value ? 1 : 0;
          //     // DbIncomes.instance.updateIncomes(task);
          //     // _updateIncomesList();
          //   },
          //   activeColor: Theme.of(context).primaryColor,
          //   value: true,
          // ),
          // onTap: () => Navigator.push(
          //   context, MaterialPageRoute(
          //     builder: (_) => AddDataScreen(
          //       updateIncomesList: _updateIncomesList(),
          //       incomes: incomes,
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
            future: _incomesList,
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
                  return _buildIncomes(snapshot.data[index - 1]);
                },
              );
            }));
  }
}
