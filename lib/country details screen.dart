import 'package:flutter/material.dart';

class CountriesDetailsScreen extends StatefulWidget {
  final String image, name, officialname, population, independent,  capital, currencies, language, borders, timezones, coatOfArms, continent;

  const CountriesDetailsScreen({super.key,
    required this.independent,
    required this.name,
    required this.officialname,

    required this.population,
    required this.image,
    required this.borders,
    required this.capital,
    required this.coatOfArms,
    required this.continent,
    required this.currencies,
    required this.language,
    required this.timezones,
  });

  @override
  State<CountriesDetailsScreen> createState() => _CountriesDetailsScreenState();
}

class _CountriesDetailsScreenState extends State<CountriesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCircularImage(widget.image),
                    _buildCircularImage(widget.coatOfArms),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildDetailRow("Official Name:  ", widget.officialname),
              _buildDetailRow("Capital:  ", widget.capital),
              _buildDetailRow("Continent:  ", widget.continent),
              _buildDetailRow("Population:  ", widget.population),
              _buildDetailRow("Currencies:  ", widget.currencies),
              _buildDetailRow("Languages:  ", widget.language),
              _buildDetailRow("Timezones:  ", widget.timezones),
              _buildDetailRow("Independent:  ", widget.independent),
              _buildDetailRow("Borders:  ", widget.borders),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          Expanded(
            child: SingleChildScrollView( // Wrap the text widget with SingleChildScrollView
              scrollDirection: Axis.horizontal, // Allow horizontal scrolling
              child: Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCircularImage(String imageUrl) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
    );
  }
}
