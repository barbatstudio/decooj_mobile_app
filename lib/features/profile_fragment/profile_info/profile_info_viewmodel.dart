import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:nominatim_location_picker/nominatim_location_picker.dart';
import 'package:flutter_map/flutter_map.dart';
class ProfileInfoViewModel extends BaseViewModel{
  final BuildContext context;

  ProfileInfoViewModel({this.context}) : super(context: context);

  Future getLocationWithNominatim() async {
    Map result = await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return NominatimLocationPicker(
            searchHint: 'جست و جو',
            awaitingForLocation: "Procurando por sua localização",
          );
        });
    if (result != null) {
      print(result);
    } else {
      return;
    }
  }
}