import 'package:flutter/material.dart';
import 'package:phr_app/services/firebase_firestore_docs.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/intl.dart' show DateFormat;

//This class is used to book appointment. It show calender and time slot and all views.

class BookAppointnment extends StatefulWidget {
  const BookAppointnment({Key? key}) : super(key: key);

  @override
  State<BookAppointnment> createState() => _BookAppointnmentState();
}

class _BookAppointnmentState extends State<BookAppointnment> {
  DateTime currDateTime = DateTime.now();
  DateTime selectedDateTime = DateTime.now();
  DateTime focusedDateTime = DateTime.now();
  TimeOfDay testSlotTime = TimeOfDay.now();
  bool isDateSelected = false;

  TextEditingController appointnmentdetail = TextEditingController();

  /// This variable is used to get the appointment type user selected
  String appointnmentType = "Video";

  bool isselected = true;
  int selectedType = 1;

  List types = ["Audio", "Video"];

  List appointnments = ["06:45", "07:00", "07:15", "07:30", "07:45"];

  //This is used to get the time slot the user has selected .You can see a Listview in which it is used where all the slot are shown
  int appointnmentTime = 0;

  CalendarFormat _format = CalendarFormat.month;

  // this function is used to upload data of appointment taken as input to firebase.
  //this function call the function addappointnment in class firebaseDirestoreDocs
  Future<void> bookappointmenttime() async {
    FirebaseFirestoreDocs abc = FirebaseFirestoreDocs();
    String formattedDate = DateFormat('MMM d, yyyy').format(selectedDateTime);
    await abc.addappointnment(appointnmentType, appointnmentdetail.text,
        formattedDate, appointnments[appointnmentTime]);
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) - padding.top;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF5F5F5),
        body: Container(
          margin: const EdgeInsets.only(bottom: 10),
          // height: _height-40,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: 20, top: 0.05 * height + 10, bottom: 10),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.black,
                          iconSize: 30,
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          left: 30, top: 0.02 * height, bottom: 10),
                      child: Text(
                        "Book Appointments",
                        style: TextStyle(
                            color: const Color(0xff112C41),
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.03),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),

                TableCalendar(
                  rowHeight: 50,
                  headerStyle: const HeaderStyle(
                    // formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  daysOfWeekVisible: true,
                  calendarFormat: _format,
                  onFormatChanged: (CalendarFormat format) {
                    setState(() {
                      _format = format;
                    });
                  },
                  availableGestures: AvailableGestures.all,
                  focusedDay: focusedDateTime,
                  firstDay: currDateTime,
                  lastDay: currDateTime.add(
                    const Duration(days: 14),
                  ),
                  calendarStyle: const CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: Color(0x8142CCC3),
                      shape: BoxShape.circle,
                    ),
                  ),
                  onDaySelected: (DateTime selectDate, DateTime focusDay) {
                    setState(() {
                      selectedDateTime = selectDate;
                      focusedDateTime = focusDay;
                      isDateSelected = true;
                    });
                  },
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(
                      selectedDateTime,
                      date,
                    );
                  },
                ),

                Container(
                  margin: EdgeInsets.only(
                      left: 0.055555 * width, right: 0.055555 * width),
                  child: const Text(
                    "Available Times",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff0C2730),
                        fontWeight: FontWeight.w500),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 0.055555 * width),
                  height: 0.057877 * height,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                appointnmentTime = index;
                              });
                            },
                            child: TabbarItems(
                                color: appointnmentTime == index
                                    ? const Color(0xff15C000)
                                    : const Color(0xffF5F5F5),
                                text: appointnments[index]));
                      }),
                    ),
                  ),
                ),

                SizedBox(
                  height: 0.0025575 * height,
                ),
                SizedBox(
                    height: 0.102301 * height,
                    child: Wrap(
                      children: List.generate(2, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedType = index;
                              if (selectedType == 1) {
                                appointnmentType = types[1];
                              } else {
                                appointnmentType = types[0];
                              }
                            });
                          },
                          child: Appointments(
                            color: index == selectedType
                                ? const Color(0xff15C000)
                                : const Color(0xffF5F5F5),
                            text: types[index],
                          ),
                        );
                      }),
                    )),

                Container(
                  margin: EdgeInsets.only(
                      left: 0.005555 * width, right: 0.055555 * width),
                  child: const Text(
                    "Appointment Note",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff0C2730),
                        fontWeight: FontWeight.w500),
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 0.20 * height,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: appointnmentdetail,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE4DFDF),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffE4DFDF),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter appointment notes here...',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                // Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  height: 0.04 * height,
                  child: TextButton(
                    onPressed: () async {
                      if (appointnmentdetail.text.isNotEmpty) {
                        await bookappointmenttime();
                        if (mounted) Navigator.pop(context);
                      } else {
                        const scnakbar = SnackBar(
                          content: Text('Give Appointnment Details'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(scnakbar);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff5669FF),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xff5669FF),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Book Appointment',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

/// this is a widget used to show the appointment types like video
class Appointments extends StatelessWidget {
  final Color color;
  final String text;
  const Appointments({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) - padding.top;
    return Container(
        margin: EdgeInsets.only(right: 0.055555 * width),
        padding: EdgeInsets.only(
            top: 0.012787 * height,
            bottom: 0.012787 * height,
            left: 0.027777777 * width,
            right: 0.027777777 * width),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.01666 * width),
          border: Border.all(color: color, width: 0.005555 * width),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Color(0xff2c2c2c),
              fontWeight: FontWeight.w400,
              fontSize: 15),
        ));
  }
}

//This is a widget which is used to show each time slot for appointment which contain time

class TabbarItems extends StatelessWidget {
  final Color color;
  final String text;
  final bool isPM;
  const TabbarItems({
    Key? key,
    required this.color,
    required this.text,
    this.isPM = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) - padding.top;
    return Container(
        margin: EdgeInsets.only(
            right: 0.055555 * width,
            top: 0.0027877 * height,
            bottom: 0.006393 * height),
        padding: EdgeInsets.only(
            top: 0.012787 * height,
            bottom: 0.012787 * height,
            left: 0.027777777 * width,
            right: 0.027777777 * width),
        decoration: BoxDecoration(
          // color: Color(0xff15C000),
          color: color,
          borderRadius: BorderRadius.circular(0.01666 * width),
          border: Border.all(color: color, width: 0.005555 * width),
        ),
        child: Column(
          children: [
            Text(
              "$text AM",
              style: const TextStyle(
                  color: Color(0xffB4B4B4),
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
            // Text(
            //   " PM",
            //   style: TextStyle(
            //       color:  Color(0xffB4B4B4),
            //       fontWeight: FontWeight.w700,
            //       fontSize: 15),
            // ),
          ],
        ));
  }
}
