import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:pawlog/ui/component/pl_filled_button.dart';

class MeetupMap extends StatefulWidget {
  static const routeName = '/meetup-map';

  const MeetupMap({Key key}) : super(key: key);

  @override
  _MeetupMapState createState() => _MeetupMapState();
}

class _MeetupMapState extends State<MeetupMap> {
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
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        _buildMap(),
        _buildInterface(),
      ],
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
    return Padding(
      padding: const EdgeInsets.all(25),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildMatchInfo(),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryVariant,
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
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: PLFilledButton(
                title: 'End Meetup',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchInfo() {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
          ),
          child: Row(
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
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
