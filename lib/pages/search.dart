import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:openweather_app/pages/home.dart';

const kGoogleApiKey = "key";

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  GeoCode geoCode = GeoCode();
  String currentAddress = 'My Address';
  // Position? currentposition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          Prediction? p = await PlacesAutocomplete.show(
              context: context, apiKey: kGoogleApiKey);
          if (p == null) {
            if (!mounted) return;
            Navigator.pop(context);
          } else {
            displayPrediction(p);
          }
        },
        child: Scaffold(
          appBar: AppBar(
              title: Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.black),
          )),
          body: Container(
            alignment: Alignment.center,
            child: Text(
              'Tap to start searching',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);

      var placeId = p.placeId;
      double lat = detail.result.geometry!.location.lat;
      double lng = detail.result.geometry!.location.lng;

      var address = await Geocoder2.getDataFromAddress(
          address: p.description!, googleMapApiKey: kGoogleApiKey);

      print(lat);
      print(lng);
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
        Placemark place = placemarks[0];
        setState(
          () {
            currentAddress =
                " ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea} ${place.postalCode}";
            // Loader.hide();
          },
        );
      } catch (e) {
        print(e);
      }
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    lat: lat,
                    long: lng,
                    location: currentAddress,
                  )),
          (route) => false);
    }
  }
}
