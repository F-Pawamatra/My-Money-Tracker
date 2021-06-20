import 'package:flutter/services.dart';
import 'package:my_app/db/dbIncomes_helper.dart';
import 'package:my_app/models/incomes_models.dart';
import '/common/color_constants.dart';
import '/models/incomes_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class InputIncomesPart extends StatefulWidget {
  final Function updateIncomesList;
  final Incomes incomes;
  final Animation<double> animation;
  InputIncomesPart({this.updateIncomesList, this.incomes, this.animation});

  @override
  _InputIncomesPartState createState() => _InputIncomesPartState();
}

class _InputIncomesPartState extends State<InputIncomesPart> {
  final _formKey = GlobalKey<FormState>();
  String _nama;
  String _jenis;
  int _nominal;
  DateTime _date = DateTime.now();
  TextEditingController _dateController = TextEditingController();

  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  final List<String> _macamJenis = ['Salary', 'Bussines', 'Other'];

  @override
  void initState() {
    super.initState();
    if (widget.incomes != null) {
      _nama = widget.incomes.nama;
      _date = widget.incomes.date;
      _jenis = widget.incomes.jenis;
    }
    _dateController.text = _dateFormatter.format(_date);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  _handleDatePicker() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('$_nama, $_date, $_jenis, $_nominal');

      Incomes incomes =
          Incomes(nama: _nama, date: _date, jenis: _jenis, nominal: _nominal);

      // if (widget.task == null) {
      //   task.status = 0;
      //   DatabaseHelper.instance.insertTask(task);
      // } else {
      //   task.status = widget.task.status;
      //   DatabaseHelper.instance.updateTask(task);
      // }
      DbIncomes.instance.insertIncomes(incomes);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animation,
      child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Container(
              width: 393,
              margin: EdgeInsets.fromLTRB(25, 0, 25, 10),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 18.0)),
                            decoration: InputDecoration(
                                labelText: 'Incomes Name',
                                labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 18.0)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (input) {
                              if (input == null || input.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            onSaved: (String input) => _nama = input,
                            initialValue: _nama,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: _dateController,
                            onTap: _handleDatePicker,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 18.0)),
                            decoration: InputDecoration(
                                labelText: 'Date',
                                labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 18.0)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (input) {
                              if (input == null || input.isEmpty) {
                                return 'Please enter date';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: DropdownButtonFormField(
                            icon: Icon(Icons.arrow_drop_down_circle),
                            iconSize: 22.0,
                            iconEnabledColor: ColorConstants.kindigocolor,
                            items: _macamJenis.map((String priority) {
                              return DropdownMenuItem(
                                value: priority,
                                child: Text(
                                  priority,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.0),
                                ),
                              );
                            }).toList(),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 18.0)),
                            decoration: InputDecoration(
                                labelText: 'Incomes Type',
                                labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 18.0)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (input) {
                              if (input == null) {
                                return 'Please select incomes type';
                              }
                              return null;
                            },
                            onSaved: (String input) => _jenis = input,
                            onChanged: (String value) {
                              setState(() {
                                _jenis = value;
                              });
                            },
                            value: _jenis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontSize: 18.0)),
                            decoration: InputDecoration(
                                labelText: 'Nominal',
                                labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(fontSize: 18.0)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (input) {
                              if (input == null || input.isEmpty) {
                                return 'Please enter nominal';
                              }
                              return null;
                            },
                            onSaved: (String input) =>
                                _nominal = int.parse(input),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    ColorConstants.korangeColor,
                                    ColorConstants.kpurplecolor,
                                    ColorConstants.kindigocolor
                                  ])),
                          child: TextButton(
                            child: Text(
                              'Submit',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                            ),
                            onPressed: _submit,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
