import 'dart:math' as math;

import 'package:yandex_map_parking_layer_test/features/get_tile/data/models/pixels_location.dart';
import 'package:yandex_map_parking_layer_test/features/get_tile/data/models/tile_number.dart';


PixelLocation fromGeoToPixels(double lat, double lon, double zoom) {
  double pi = math.pi;
  double e = 0.0818191908426;
  double x, y;
  double rho;
  double beta;
  double phi;
  double theta;
  rho = math.pow(2, zoom + 8) / 2;
  beta = lat * pi / 180;
  phi = (1 - e * math.sin(beta)) / (1 + e * math.sin(beta));
  theta = math.tan(pi / 4 + beta / 2) * math.pow(phi, e / 2);

  x = rho * (1 + lon / 180);
  y = rho * (1 - math.log(theta) / pi);
  return PixelLocation(x: x, y: y);
}

TileNumber fromPixelsToTileNumber(double x, double y) {
  return TileNumber(x: (x / 256).floor(), y: (y / 256).floor());
}
