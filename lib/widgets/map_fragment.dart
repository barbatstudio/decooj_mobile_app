import 'dart:async';

import 'package:decooj_buyers/features/profile_fragment/address/new_address/adress_info_view.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wordpress/schemas/post_statuses.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  void initState() {
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController googleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void selectLocation() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FlatButton(
          onPressed: () async {

            LatLngBounds bounds =  await googleMapController.getVisibleRegion();
            print(bounds);

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>AddressInfoView(bounds: bounds,)));

          },
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(
            'تایید',
            style: kTitleTextStyle.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        body: Stack(children: [
          GoogleMap(
            mapType: MapType.normal,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onCameraMove: (position){
              print(position.target);
            },
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              googleMapController = controller;

            },
          ),
          Center(
            child: Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Icon(
                  Icons.location_on,
                  color: kAccentColor,
                  size: 50,
                )),
          ),
        ]),
      ),
    );
  }
}
