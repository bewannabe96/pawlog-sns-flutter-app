import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MeetupMapScreen extends StatefulWidget {
  static const routeName = '/meetup-map';

  const MeetupMapScreen({Key key}) : super(key: key);

  @override
  _MeetupMapScreenState createState() => _MeetupMapScreenState();
}

class _MeetupMapScreenState extends State<MeetupMapScreen> {
  Completer<GoogleMapController> _mapController = Completer();
  Location _userLocation = Location();

  void _moveCameraToUser({bool animate = false}) async {
    LocationData location = await _userLocation.getLocation();
    GoogleMapController controller = (await _mapController.future);
    CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(location.latitude, location.longitude), zoom: 18),
    );
    animate
        ? controller.animateCamera(cameraUpdate)
        : controller.moveCamera(cameraUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          _buildMap(),
          _buildInterface(),
        ],
      ),
    );
  }

  Widget _buildMap() {
    _moveCameraToUser();
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(0.0, 0.0),
        zoom: 10,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  Widget _buildInterface() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 5)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.black26,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Jim',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Dexter | Cash | Samba',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushReplacementNamed('/list'),
                    icon: const Icon(
                      FontAwesomeIcons.signOutAlt,
                    ),
                    color: Colors.white,
                    iconSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 5)
                  ],
                ),
                child: IconButton(
                  onPressed: () => _moveCameraToUser(animate: true),
                  icon: const Icon(
                    Icons.my_location,
                  ),
                  color: Colors.white,
                  iconSize: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
