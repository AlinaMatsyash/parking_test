import 'package:yandex_map_parking_layer_test/features/get_tile/data/models/location.dart';

class Params {
  final double zoom;
  final Location location;

  Params({
    required this.zoom,
    required this.location,
  });
}
