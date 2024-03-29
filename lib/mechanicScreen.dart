import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TomTomApi {
  static const String apiKey = 'e0sHgBKJi3hDiMxWTvcGbvnRgJUQL6ar';

  static Future<List<Mechanic>> searchNearbyMechanics(
      double latitude, double longitude) async {
    final url =
        'https://api.tomtom.com/search/2/poiSearch/mechanic.json?limit=10&lat=$latitude&lon=$longitude&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      List<Mechanic> mechanics = [];
      for (var result in results) {
        mechanics.add(Mechanic.fromJson(result));
      }
      return mechanics;
    } else {
      throw Exception('Failed to load nearby mechanics');
    }
  }
}

class Mechanic {
  final String name;
  final String address;

  Mechanic({
    required this.name,
    required this.address,
  });

  factory Mechanic.fromJson(Map<String, dynamic> json) {
    return Mechanic(
      name: json['poi']['name'],
      address: json['address']['freeformAddress'],
    );
  }
}

class MechanicScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MechanicScreen({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  _MechanicScreenState createState() => _MechanicScreenState();
}

class _MechanicScreenState extends State<MechanicScreen> {
  List<Mechanic> mechanics = [];

  @override
  void initState() {
    super.initState();
    _fetchNearbyMechanics(widget.latitude, widget.longitude);
  }

  // Fetch nearby mechanics using latitude and longitude
  Future<void> _fetchNearbyMechanics(double latitude, double longitude) async {
    try {
      final response = await TomTomApi.searchNearbyMechanics(
        widget.latitude,
        widget.longitude,
      );
      setState(() {
        mechanics = response;
      });
    } catch (e) {
      print('Error fetching nearby mechanics: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Mechanics'),
      ),
      body: mechanics.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: mechanics.length,
              itemBuilder: (context, index) {
                final mechanic = mechanics[index];
                return Card(
                  surfaceTintColor: Colors.lightBlue,
                  child: ListTile(
                      title: Text(mechanic.name),
                      subtitle: Text(mechanic.address)),
                );
              },
            ),
    );
  }
}
