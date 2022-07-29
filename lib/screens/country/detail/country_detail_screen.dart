import 'package:covid_app/widgets/case_data_row.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatefulWidget {
  final String name;
  final String image;
  final int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  const CountryDetailScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  }) : super(key: key);

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        leading: const BackButton(),
        title: Text(widget.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [

              Padding(
                padding: EdgeInsets.only(top: height * 0.067, left: 20.0, right: 20.0),
                child: Card(
                  color: Color(0xff125121),
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.06,),
                      CaseDataRow(title: 'Total Cases', value: widget.totalCases.toString()),
                      CaseDataRow(title: 'Total Deaths', value: widget.totalDeaths.toString()),
                      CaseDataRow(title: 'Total Recovered', value: widget.totalRecovered.toString()),
                      CaseDataRow(title: 'Active', value: widget.active.toString()),
                      CaseDataRow(title: 'Critical', value: widget.critical.toString()),
                      CaseDataRow(title: 'Today Recovered', value: widget.todayRecovered.toString()),
                      CaseDataRow(title: 'Total Tests', value: widget.test.toString()),
                    ],
                  ),
                ),
              ),

              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
