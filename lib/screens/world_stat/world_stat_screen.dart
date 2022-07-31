import 'package:covid_app/models/WorldStatsModel.dart';
import 'package:covid_app/screens/country/country_list_screen.dart';
import 'package:covid_app/services/world_stat_service.dart';
import 'package:covid_app/widgets/case_data_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatScreen extends StatefulWidget {
  const WorldStatScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatScreen> createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  List<Color> colors = [
    Colors.blueAccent,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    WorldStatServices statServices = WorldStatServices();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              FutureBuilder(
                future: statServices.worldStatApi(),
                builder: (context, AsyncSnapshot<WorldStatsModel> snapshot) {

                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50.0,
                        controller: _animationController,
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /// chart
                        PieChart(
                          dataMap: {
                            'Total Cases': double.parse(
                                snapshot.data!.cases!.toString()),
                            'Deaths': double.parse(
                                snapshot.data!.deaths!.toString()),
                            'Recovered': double.parse(
                                snapshot.data!.recovered!.toString()),
                          },
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left,
                            legendTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                            ),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          colorList: colors,
                          chartType: ChartType.ring,
                          chartRadius: 120,
                          ringStrokeWidth: 15,
                          animationDuration:
                              const Duration(milliseconds: 1200),
                        ),
                        SizedBox(height: height * 0.02),

                        /// data in card
                        Card(
                          color: const Color(0xff363636),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CaseDataRow(
                                    title: 'Population',
                                    value:
                                        snapshot.data!.population.toString()),
                                CaseDataRow(
                                    title: 'Total Tests',
                                    value: snapshot.data!.tests.toString()),
                                CaseDataRow(
                                    title: 'Cases',
                                    value: snapshot.data!.cases.toString()),
                                CaseDataRow(
                                    title: 'Recovered',
                                    value:
                                        snapshot.data!.recovered.toString()),
                                CaseDataRow(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths.toString()),
                                CaseDataRow(
                                    title: 'Today Cases',
                                    value:
                                        snapshot.data!.todayCases.toString()),
                                CaseDataRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered
                                        .toString()),
                                CaseDataRow(
                                    title: 'Today Deaths',
                                    value: snapshot.data!.todayDeaths
                                        .toString()),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),

                        /// track countries button
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CountryListScreen(),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: Ink(
                              width: width,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.green,
                              ),
                              child: const Center(
                                child: Text(
                                  'Track Countries',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
