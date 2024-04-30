import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

//This class is used to show graphs of vitals
class MedicalTimelineGraphs extends StatefulWidget {
  final List<Stepdata> steps;
  final List<Stepdata> calories;
  final List<Stepdata> heartrate;
  final List<Stepdata> suger;
  final String fromdate;
  final String todate;
  const MedicalTimelineGraphs(
      {Key? key,
      required this.steps,
      required this.calories,
      required this.heartrate,
      required this.fromdate,
      required this.todate,
      required this.suger})
      : super(key: key);

  @override
  State<MedicalTimelineGraphs> createState() => _MedicalTimelineGraphsState();
}

class _MedicalTimelineGraphsState extends State<MedicalTimelineGraphs> {
  // Map<String,int> steps=new Map<String,int>();
  // Map<String,int> calories=new Map<String,int>();
  // Map<String,int> heartrate=new Map<String,int>();
  // Map<String,int> suger=new Map<String,int>();

  // List<Stepdata> stes=[];
  // List<Stepdata> Calories=[];
  // List<Stepdata> hertrate=[];

  @override
  Widget build(BuildContext context) {
    // print(widget.arr);

    // getallsuger(sug);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("My Vitals"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.navigate_before),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 10, right: 25, left: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              widget.steps.isEmpty
                  ? Container()
                  : SfCartesianChart(
                      title: ChartTitle(text: 'Steps'),
                      primaryXAxis: CategoryAxis(labelRotation: 90),
                      series: <ChartSeries>[
                        LineSeries<Stepdata, String>(
                            enableTooltip: true,
                            dataSource: widget.steps,
                            xValueMapper: (Stepdata data, _) => data.x,
                            yValueMapper: (Stepdata data, _) => data.y,
                            // Render the data label
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              widget.heartrate.isEmpty
                  ? Container()
                  : SfCartesianChart(
                      title: ChartTitle(text: 'Heartrate'),
                      primaryXAxis: CategoryAxis(labelRotation: 90),
                      series: <ChartSeries>[
                        LineSeries<Stepdata, String>(
                            enableTooltip: true,
                            dataSource: widget.heartrate,
                            xValueMapper: (Stepdata data, _) => data.x,
                            yValueMapper: (Stepdata data, _) => data.y,
                            // Render the data label
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              widget.calories.isEmpty
                  ? Container()
                  : SfCartesianChart(
                      title: ChartTitle(text: 'Calories'),
                      primaryXAxis: CategoryAxis(labelRotation: 90),
                      series: <ChartSeries>[
                        LineSeries<Stepdata, String>(
                            enableTooltip: true,
                            dataSource: widget.calories,
                            xValueMapper: (Stepdata data, _) => data.x,
                            yValueMapper: (Stepdata data, _) => data.y,
                            // Render the data label
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              widget.suger.isEmpty
                  ? Container()
                  : SfCartesianChart(
                      title: ChartTitle(text: 'Suger'),
                      primaryXAxis: CategoryAxis(labelRotation: 90),
                      series: <ChartSeries>[
                        LineSeries<Stepdata, String>(
                            enableTooltip: true,
                            dataSource: widget.suger,
                            xValueMapper: (Stepdata data, _) => data.x,
                            yValueMapper: (Stepdata data, _) => data.y,
                            // Render the data label
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Stepdata {
  Stepdata(this.x, this.y);
  final String x;
  final int y;
}

class Calorydata {
  Calorydata(this.x, this.y);
  final String x;
  final int y;
}

class Heartrate {
  Heartrate(this.x, this.y);
  final String x;
  final int y;
}
