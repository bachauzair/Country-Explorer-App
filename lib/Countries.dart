import 'package:country_information_app/States%20Services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'country details screen.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();
  StatesServices statesServices = StatesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Countries Information',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Search Countries",
                  prefixIcon: const Icon(Icons.search), // Add search icon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: statesServices.CountriesListApi(),
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Container(height: 10, width: 89, color: Colors.white,),
                            leading: Container(height: 10, width: 89, color: Colors.white,),
                          );
                        },
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['name']['common'].toString();
                        if (searchController.text.isEmpty ||
                            name.toLowerCase().contains(searchController.text.toLowerCase())) {
                          return Card(
                            elevation: 5, // Add elevation for a card-like effect
                            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CountriesDetailsScreen(
                                      name: snapshot.data![index]['name']['common'].toString(),
                                      officialname: snapshot.data![index]['name']['official'].toString(),
                                      image: snapshot.data![index]['flags']['png'].toString(),
                                      borders: snapshot.data![index]['borders'].toString(),
                                      capital: snapshot.data![index]['capital'].toString(),
                                      coatOfArms: snapshot.data![index]['coatOfArms']['png'].toString(),
                                      continent: snapshot.data![index]['continents'].toString(),
                                      currencies: snapshot.data![index]['currencies'].toString(),
                                      language: snapshot.data![index]['languages'].toString(),
                                      timezones: snapshot.data![index]['timezones'].toString(),
                                      population: snapshot.data![index]['population'].toString(),
                                      independent: snapshot.data![index]['independent'].toString(),

                                    ),
                                  ),
                                );

                              },
                              child: ListTile(
                                title: Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(snapshot.data![index]['flags']['png']),
                                ),
                              ),
                            ),
                          );
                        } else {
                          // Return an empty container for non-matching items
                          return Container();
                        }
                      },
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
