import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/data/formulas/formulas.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/data/models/location.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/data/models/params.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/data/models/pixels_location.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/data/models/tile_number.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/presentation/widgets/result_tile.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/presentation/widgets/text_field_app.dart';

import 'package:yandex_map_parking_layer_test/res/assets/colors.gen.dart';
import 'package:yandex_map_parking_layer_test/theme/app_typography.dart';

@RoutePage()
class TileScreen extends StatefulWidget {
  const TileScreen({super.key});

  @override
  State<TileScreen> createState() => _TileScreenState();
}

class _TileScreenState extends State<TileScreen> {
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController zoomController = TextEditingController();
  bool isRequestCompleted = false;
  late PixelLocation pixelLocation;
  late TileNumber tileNumber;

  late Params params;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorName.active,
        title: Text(
          'Parking',
          style:
              AppTypography.santelloMedium22.copyWith(color: ColorName.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FieldApp(
                    labelText: 'latitude',
                    controller: latitudeController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Fill in the field';
                      }
                      if (!latValidate.hasMatch(value!)) {
                        return 'Keep correct data (from -90 to 90)';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  FieldApp(
                    controller: longitudeController,
                    labelText: 'longitude',
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Fill in the field';
                      }
                      if (!lonValidate.hasMatch(value!)) {
                        return 'Keep specific data (from -180 to 180)';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  FieldApp(
                    controller: zoomController,
                    labelText: 'Zoom',
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Fill in the field';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isRequestCompleted = false;
                        });
                        params = Params(
                          zoom: double.tryParse(zoomController.text)!,
                          location: Location(
                              latitude:
                                  double.tryParse(latitudeController.text)!,
                              longitude:
                                  double.tryParse(longitudeController.text)!),
                        );

                        pixelLocation = fromGeoToPixels(
                            params.location.latitude,
                            params.location.longitude,
                            params.zoom);

                        tileNumber = fromPixelsToTileNumber(
                            pixelLocation.x, pixelLocation.y);

                        setState(() {
                          isRequestCompleted = true;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorName.active,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Make calculations',
                          style: AppTypography.santelloMedium22
                              .copyWith(color: ColorName.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (isRequestCompleted)
                    ResultingTile(
                      x: tileNumber.x,
                      y: tileNumber.y,
                      zoom: params.zoom,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
