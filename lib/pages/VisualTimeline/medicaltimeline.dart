import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phr_app/pages/VisualTimeline/medicaltimeline2.dart';

import '../../services/firebase_database_docs.dart';

//This class is used to take 2 date and then getting data of vitals between these date and then sort the data according to dates.
class Medicaltimeline extends StatefulWidget {
  const Medicaltimeline({Key? key}) : super(key: key);

  @override
  State<Medicaltimeline> createState() => _MedicaltimelineState();
}

class _MedicaltimelineState extends State<Medicaltimeline> {
  TextEditingController Fromdate = TextEditingController();
  TextEditingController Todate = TextEditingController();

  List<Stepdata> getallsteps(step, List<Stepdata> stes) {
    DateTime a;
    int jt = 0;
    step.forEach((key, value) {
      // print(jt);
      // jt=jt+1;
      try {
        a = DateFormat('dd-MM-yyyy HH:mm:ss').parse(key);
      } catch (e) {
        print(key);
        a = DateFormat('dd-MM-yyyy').parse(key);
      }
      print(a);
      DateTime b = DateFormat('dd-MM-yyyy').parse(Fromdate.text);
      print(b);
      DateTime c = DateFormat('dd-MM-yyyy')
          .parse(Todate.text)
          .add(const Duration(days: 1));
      print(c);
      if (a.isBefore(c) && a.isAfter(b)) {
        print('yes');
        // steps[key]=value;
        print(jt);
        jt = jt + 1;
        if (stes.isEmpty) {
          stes.add(Stepdata(key, value));
          print('done1');
        } else {
          Stepdata ar = stes.last;
          int len = stes.length;
          DateTime bcd = DateFormat('dd-MM-yyyy').parse(ar.x);
          if (a.isAfter(bcd)) {
            stes.add(Stepdata(key, value));
            print('done2');
          } else {
            for (int i = 0; i < len; i++) {
              Stepdata ar = stes[i];
              DateTime bd = DateFormat('dd-MM-yyyy').parse(ar.x);
              if (a.isBefore(bd)) {
                stes.insert(i, Stepdata(key, value));
                print('done3');
                break;
              }
            }
          }
        }
      }
    });

    return stes;
  }

  getallcalories(cal, List<Stepdata> calories) {
    DateTime a;
    cal.forEach((key, value) {
      try {
        a = DateFormat('dd-MM-yyyy HH:mm:ss').parse(key);
      } catch (e) {
        print(key);
        a = DateFormat('dd-MM-yyyy').parse(key);
      }
      DateTime b = DateFormat('dd-MM-yyyy').parse(Fromdate.text);
      DateTime c = DateFormat('dd-MM-yyyy')
          .parse(Todate.text)
          .add(const Duration(days: 1));
      if (a.isBefore(c) && a.isAfter(b)) {
        // calories[key]=value;

        // Calories.add(Stepdata(key, value));
        if (calories.isEmpty) {
          calories.add(Stepdata(key, value));
        } else {
          Stepdata ar = calories.last;
          int len = calories.length;
          DateTime bcd = DateFormat('dd-MM-yyyy').parse(ar.x);
          if (a.isAfter(bcd)) {
            calories.add(Stepdata(key, value));
          } else {
            for (int i = 0; i < len; i++) {
              Stepdata ar = calories[i];
              DateTime bd = DateFormat('dd-MM-yyyy').parse(ar.x);
              if (a.isBefore(bd)) {
                calories.insert(i, Stepdata(key, value));
                break;
              }
            }
          }
        }
      }
    });
    return calories;
  }

  getallheartrate(rate, List<Stepdata> hertrate) {
    DateTime a;
    rate.forEach((key, value) {
      try {
        a = DateFormat('dd-MM-yyyy HH:mm:ss').parse(key);
      } catch (e) {
        print(key);
        a = DateFormat('dd-MM-yyyy').parse(key);
      }
      DateTime b = DateFormat('dd-MM-yyyy').parse(Fromdate.text);
      DateTime c = DateFormat('dd-MM-yyyy')
          .parse(Todate.text)
          .add(const Duration(days: 1));
      if (a.isBefore(c) && a.isAfter(b)) {
        // heartrate[key]=value;

        // hertrate.add(Stepdata(key, value));
        if (hertrate.isEmpty) {
          hertrate.add(Stepdata(key, value));
        } else {
          Stepdata ar = hertrate.last;
          int len = hertrate.length;
          DateTime bcd = DateFormat('dd-MM-yyyy').parse(ar.x);
          if (a.isAfter(bcd)) {
            hertrate.add(Stepdata(key, value));
          } else {
            for (int i = 0; i < len; i++) {
              Stepdata ar = hertrate[i];
              DateTime bd = DateFormat('dd-MM-yyyy').parse(ar.x);
              if (a.isBefore(bd)) {
                hertrate.insert(i, Stepdata(key, value));
                break;
              }
            }
          }
        }
      }
    });
    return hertrate;
  }

  getallsuger(sug, List<Stepdata> sugar) {
    DateTime a;

    sug.forEach((key, value) {
      try {
        a = DateFormat('dd-MM-yyyy HH:mm:ss').parse(key);
      } catch (e) {
        print(key);
        a = DateFormat('dd-MM-yyyy').parse(key);
      }

      DateTime b = DateFormat('dd-MM-yyyy').parse(Fromdate.text);
      DateTime c = DateFormat('dd-MM-yyyy')
          .parse(Todate.text)
          .add(const Duration(days: 1));
      if (a.isBefore(c) && a.isAfter(b)) {
        // suger[key]=value;

        if (sugar.isEmpty) {
          sugar.add(Stepdata(key, value));
        } else {
          Stepdata ar = sugar.last;
          int len = sugar.length;
          DateTime bcd = DateFormat('dd-MM-yyyy').parse(ar.x);
          if (a.isAfter(bcd)) {
            sugar.add(Stepdata(key, value));
          } else {
            for (int i = 0; i < len; i++) {
              Stepdata ar = sugar[i];
              DateTime bd = DateFormat('dd-MM-yyyy').parse(ar.x);
              if (a.isBefore(bd)) {
                sugar.insert(i, Stepdata(key, value));
                break;
              }
            }
          }
        }
      }
    });
    return sugar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "My Timeline",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Center(
                      child: Text(
                        "From",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime.now());

                          if (pickedDate != null) {
                            print(
                                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('dd-MM-yyyy').format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(
                                formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need

                            setState(() {
                              Fromdate.text =
                                  formattedDate; //set foratted date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Date',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        )),
                  ],
                ),
                Column(
                  children: [
                    const Center(
                      child: Text(
                        "To",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime.now());

                          if (pickedDate != null) {
                            print(
                                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('dd-MM-yyyy').format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(
                                formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need

                            setState(() {
                              Todate.text =
                                  formattedDate; //set foratted date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Date',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey)),
                  onPressed: () async {
                    dynamic arr = await FirebaseDatabaseDocs.getVitals();
                    // print(arr);

                    // Map<String,dynamic> abc=arr as Map<String, dynamic>;
                    if (Fromdate.text.isNotEmpty && Todate.text.isNotEmpty) {
                      dynamic step = {};
                      try {
                        step = arr['Steps'];
                      } catch (e) {
                        step = {};
                      }

                      dynamic sug = {};
                      try {
                        sug = arr['Sugar'];
                      } catch (e) {
                        sug = {};
                      }

                      dynamic rate = {};
                      try {
                        rate = arr['HeartRate'];
                      } catch (e) {
                        rate = {};
                      }

                      dynamic cal = {};
                      try {
                        cal = arr['Calories'];
                      } catch (e) {
                        cal = {};
                      }

                      List<Stepdata> stes = getallsteps(step, []);

                      List<Stepdata> calories = getallcalories(cal, []);
                      List<Stepdata> hertrate = getallheartrate(rate, []);

                      List<Stepdata> sugar = getallsuger(sug, []);

                      print("lengths");
                      print(stes.length);
                      print(calories.length);
                      print(hertrate.length);
                      if (stes.isNotEmpty ||
                          calories.isNotEmpty ||
                          hertrate.isNotEmpty ||
                          sugar.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MedicalTimelineGraphs(
                                      heartrate: hertrate,
                                      calories: calories,
                                      steps: stes,
                                      fromdate: Fromdate.text,
                                      todate: Todate.text,
                                      suger: sugar,
                                    )));
                      } else {
                        const scnakbar = SnackBar(
                          content: Text('you doesn\'t have any reports'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(scnakbar);
                      }
                    } else {
                      const scnakbar = SnackBar(
                        content: Text('Select the Date'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(scnakbar);
                    }
                  },
                  child: const Text(
                    "ANALYSIS",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
