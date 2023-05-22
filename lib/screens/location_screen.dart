import 'package:ezy_tespen_learn/services/biometric.dart';
import 'package:ezy_tespen_learn/services/location.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: LocationService.getCurrentPosition(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null)
                  return Image.network(
                      "https://api.mapbox.com/styles/v1/mapbox/streets-v12/static/pin-s-l+000(${snapshot.data!.longitude},${snapshot.data!.latitude})/${snapshot.data!.longitude},${snapshot.data!.latitude},17/500x300?access_token=pk.eyJ1IjoiYXJpZmlza2FuZGFyIiwiYSI6ImNrMnhuODQxdTBiNGszbm1vdWJyMXIwbjgifQ.zC6YieciiPLnoeuY_YVP8g");
                return Container();
              },
            ),
            ElevatedButton(
              onPressed: () async {
                var position = await LocationService.getCurrentPosition();
                if (position != null && position.isMocked) {
                  print("Fake gps");
                }
              },
              child: Text("Get current location"),
            ),
            ElevatedButton(
              onPressed: () async {
                var isAuthenticated = await BiometricService.authenticate();
                if (isAuthenticated) {
// Hit api untuk nyimpen data absen
                } else {}
              },
              child: Text("Absen"),
            ),
          ],
        ),
      ),
    );
  }
}
