import 'package:flutter/material.dart';
import 'package:yandex_map_parking_layer_test/theme/app_typography.dart';

class ResultingTile extends StatelessWidget {
  const ResultingTile(
      {super.key, required this.x, required this.y, required this.zoom});

  final int x;
  final int y;
  final double zoom;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://core-carparks-renderer-lots.maps.yandex.net/maps-rdr-carparks/tiles?l=carparks&x=$x&y=$y&z=$zoom&scale=1&lang=ru_RU',
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Text(
          'There is no parking tile at these coordinates',
          style: AppTypography.santelloRegular17,
        );
      },
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }

        return Column(
          children: [
            Text(
              'Tile: [$x, $y]',
              style: AppTypography.santelloRegular17,
            ),
            const SizedBox(
              height: 16,
            ),
            child,
          ],
        );
      },
    );
  }
}
