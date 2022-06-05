import 'package:bmi_calc/pages/info_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/indicator.dart';
import 'package:bmi_calc/utils/color_extensions.dart';

class DietPage2 extends StatefulWidget {

  @override
  _DietPage2 createState() => _DietPage2();


}

class _DietPage2 extends State<DietPage2> {

  InfoText infoText = new InfoText();
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "İdeal Kiloda Olanlar İçin Beslenme Programı"
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height:size.height * 0.13,
            color: Colors.white12,
            child: infoText.infoGraphic(),
          ),
          Container(
              height: size.height * 0.4,
              child: AspectRatio(
                aspectRatio: 1.3,
                child: Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                                pieTouchData: PieTouchData(touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                }),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 40,
                                sections: showingSections()),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Indicator(
                            color: Color(0xff0293ee),
                            text: 'Karbonhidrat',
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xfff8b250),
                            text: 'Yağ',
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xff845bef),
                            text: 'Protein',
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                    ],
                  ),
                ),
              )
          ),

          Container(
            height: size.height * 0.05,
            color: Colors.white12,
            child: infoText.info_47(),
          ),
          Container(
            height: size.height * 0.3,
            color: Colors.white12,
            child: Center(child: infoText.info_48()),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:

          return PieChartSectionData(
                color: const Color(0xff0293ee),
                value: 17,
                title: '17%',
                radius: radius,
                titleStyle: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff)),
              );

        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 25,
            title: '25%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 12,
            title: '12%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}
