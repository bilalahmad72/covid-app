import 'package:covid_app/services/world_stat_service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WorldStatServices statServices = WorldStatServices();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        leading: const BackButton(),
        title: const Text('Countries'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// search field
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(

                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),

                controller: searchController,
                onChanged: (value){
                  setState(() {

                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search Country',
                  hintStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white24,
                  ),
                  contentPadding: const EdgeInsets.only(left: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                      color: Colors.white24,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                      color: Colors.white24,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                      color: Colors.white24,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),

            /// countries list
            Expanded(
              child: FutureBuilder(
                future: statServices.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return  ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade800,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                  ),
                                  onTap: () {},
                                  title: Container(
                                    height: 15.0,
                                    width: width,
                                    color: Colors.white,
                                  ),
                                  subtitle:  Container(
                                    height: 15.0,
                                    width: width,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Scrollbar(
                      isAlwaysShown: true,
                      showTrackOnHover: true,
                      radius: const Radius.circular(10.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {

                          String countryName = snapshot.data![index]['country'];

                          if(searchController.text.isEmpty) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        snapshot.data![index]['countryInfo']['flag'],
                                      ),
                                    ),
                                    onTap: () {},
                                    title: Text(snapshot.data![index]['country'].toString(),
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(snapshot.data![index]['cases'].toString(),
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }else if(countryName.toLowerCase().contains(searchController.text.toLowerCase())) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        snapshot.data![index]['countryInfo']['flag'],
                                      ),
                                    ),
                                    onTap: () {},
                                    title: Text(snapshot.data![index]['country'].toString(),
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(snapshot.data![index]['cases'].toString(),
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }else {
                            return Container();
                          }
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
