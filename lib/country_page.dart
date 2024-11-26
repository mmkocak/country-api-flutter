import 'package:country_ornek/country_servicies.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({ Key? key }) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  late Future<List<dynamic>> futureCountries;
  @override
  void initState(){
    super.initState();
    futureCountries = fetchCountries();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: futureCountries,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text("Failed to load countries ${snapshot.error}"),);
          }else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text("No countries found"),);
          }
            final countries = snapshot.data!;
            return ListView.builder(itemCount: countries.length, itemBuilder: (context, index) {
              return ListTile(
                  title: Text(countries[index]['name']?['common'] ?? 'Unkovn Name'),
                  subtitle: Text(countries[index]['region'] ?? " No Region"),
              );
            },);
        },
      ),
    );
  }
}