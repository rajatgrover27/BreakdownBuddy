import 'package:breakdown_assistant/login.dart';
import 'package:breakdown_assistant/mechanicScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location_package;
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  location_package.Location location = location_package.Location();
  LatLng? _initialLocation;
  String? _currentAddress;
  Marker? _marker;
  String appBarText = "Current Location: Loading...";

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _launchCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Get the current user's location
  void _getUserLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        _initialLocation =
            LatLng(userLocation.latitude!, userLocation.longitude!);
        _getAddressFromLatLng(_initialLocation!);
        _marker = Marker(
          markerId: MarkerId("current_location"),
          position: _initialLocation!,
          draggable: true,
          onDragEnd: (newPosition) {
            _getAddressFromLatLng(newPosition);
          },
        );
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  // Get the address from latitude and longitude coordinates
  void _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark currentAddress = placemarks[0];
        setState(() {
          _currentAddress =
              "${currentAddress.name},${currentAddress.street}, ${currentAddress.locality}";
          appBarText = "$_currentAddress";
        });
      }
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
          title: Container(
            padding: EdgeInsets.all(8.0),
            width: 450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
            child: Text(
              appBarText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.login),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreenPage()),
                  );
                },
              );
            },
          ),
        ),
        drawer: _buildDrawer(context),
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
                    markers: _marker != null
                        ? Set<Marker>.from([_marker!])
                        : Set<Marker>(),
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
                  onPressed: () {
                    _launchCall('102');
                  },
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
                  onPressed: () {
                    _launchCall('100');
                  },
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MechanicScreen()),
                      );
                    },
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

Widget _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height:80,
          child: DrawerHeader(
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
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Add your onTap logic here
          },
        ),
        Container(
            height: 50,
            width: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreenPage(), // Replace with the screen you want to navigate to
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors
                      .white, // Set text color to white for visibility
                ),
              ),
            )),
      ],
    ),
  );
}
