import 'package:country_information_app/Countries.dart';
import 'package:flutter/material.dart';

class CountryStatesScreen extends StatefulWidget {
  const CountryStatesScreen({super.key});

  @override
  State<CountryStatesScreen> createState() => _CountryStatesScreenState();
}

class _CountryStatesScreenState extends State<CountryStatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Image.asset(
                "Assets/countries.png",
                height: 300,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Explore Countries",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Discover detailed information about any country in the list. '
                    'Select your desired country to view its complete details.',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CountriesList()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.green,
                ),
                height: 50,
                width: 300,
                child: const Center(
                  child: Text(
                    'Choose Country',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
