import 'package:flutter/material.dart';
import 'dart:async';
// import 'dart:ui' as ui;

// import 'dart:ffi';
// import 'dart:typed_data';

import 'package:fab_circular_menu/fab_circular_menu.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_rating_stars/flutter_rating_stars.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:googlemapsapp/models/auto_complete_result.dart';
// import 'package:googlemapsapp/providers/search_places.dart';
// import 'package:googlemapsapp/services/map_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  bool searchToggle = false;
  bool radiusSlider = false;
  bool cardTapped = false;
  bool pressedNear = false;
  bool getDirections = false;

  //Initial map position on load
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  //Providers
  // final allSearchResults = ref.watch(placeResultsProvider);
  // final searchFlag = ref.watch(searchToggleProvider);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FabCircularMenu(
          alignment: Alignment.bottomLeft,
          fabColor: Colors.blue.shade50,
          fabOpenColor: Colors.red.shade100,
          ringDiameter: 250.0,
          ringWidth: 60.0,
          ringColor: Colors.blue.shade50,
          fabSize: 60.0,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    searchToggle = true;
                    radiusSlider = false;
                    pressedNear = false;
                    cardTapped = false;
                    getDirections = false;
                  });
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  setState(() {
                    searchToggle = false;
                    radiusSlider = false;
                    pressedNear = false;
                    cardTapped = false;
                    getDirections = true;
                  });
                },
                icon: Icon(Icons.navigation))
          ]),
    );
  }
}
