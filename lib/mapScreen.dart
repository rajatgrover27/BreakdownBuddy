import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool showBottomMenu = false;
  GoogleMapController? mapController;
  Location location = Location();
  LatLng? _initialLocation;
  String appBarText = "Current Location: Loading...";

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // Get the current user's location
  void _getUserLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        _initialLocation =
            LatLng(userLocation.latitude!, userLocation.longitude!);
        appBarText = "Current Location: ${userLocation.latitude}, ${userLocation.longitude}";
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double threshold = 1000;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarText),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: _buildDrawer(),
        body: Stack(
          children: [
            _initialLocation == null
                ? Center(child: CircularProgressIndicator())
                : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialLocation!,
                zoom: 15,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
            Positioned(
              bottom: 80.0,
              left: MediaQuery.of(context).size.width / 4 - 75,
              // Adjust the left offset to position the left button
              child: Container(
                height: 44.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.red[400]!, // Adjust the shades of red as needed
                        Colors.red[900]!,
                      ],
                    )),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Ambulance',
                    style: TextStyle(
                      color: Colors
                          .white, // Set text color to white for visibility
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80.0,
              right: MediaQuery.of(context).size.width / 4 - 75,
              // Adjust the right offset to position the right button
              child: Container(
                height: 44.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(colors: [
                      Colors.red[400]!,
                      // Adjust the shades of red as needed
                      Colors.red[900]!,
                    ])),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    '    Police    ',
                    style: TextStyle(
                      color: Colors
                          .white, // Set text color to white for visibility
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 26.0,
              left: MediaQuery.of(context).size.width / 2 - 75,
              // Adjust the left offset to center the button
              child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 2, 173, 102),
                        Colors.blue
                      ])),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Mechanics',
                              style: TextStyle(
                                color: Colors
                                    .black, // Set text color to black for visibility
                              ),
                            ),
                            Icon(Icons.home_repair_service_rounded),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Add your onTap logic here
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Add your onTap logic here
          },
        ),
        // Add more ListTiles for additional items
      ],
    ),
  );
}
