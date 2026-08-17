import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final LatLng _center = const LatLng(13.736717, 100.523186);

  final List<Map<String, dynamic>> _bikes = [
    {'location': const LatLng(13.737717, 100.524186), 'isInUse': false},
    {'location': const LatLng(13.735717, 100.522186), 'isInUse': true},
    {'location': const LatLng(13.738717, 100.521186), 'isInUse': false},
  ];

  final List<LatLng> _parkingZone = [
    const LatLng(13.7370, 100.5220),
    const LatLng(13.7370, 100.5240),
    const LatLng(13.7350, 100.5240),
    const LatLng(13.7350, 100.5220),
  ];

  final List<LatLng> _ridingLimitZone = [
    const LatLng(13.7400, 100.5200),
    const LatLng(13.7400, 100.5260),
    const LatLng(13.7320, 100.5260),
    const LatLng(13.7320, 100.5200),
    const LatLng(13.7400, 100.5200),
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(initialCenter: _center, initialZoom: 15.0),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.bidkan',
        ),
        PolygonLayer(
          polygons: [
            Polygon(points: _parkingZone, color: Colors.blue.withOpacity(0.3), borderColor: Colors.blue, borderStrokeWidth: 2),
          ],
        ),
        PolylineLayer(
          polylines: [
            Polyline(points: _ridingLimitZone, color: Colors.red, strokeWidth: 3.0),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: const LatLng(13.7360, 100.5230),
              width: 80,
              height: 80,
              child: Image.asset('lib/assets/images/Parking-Zone.png', fit: BoxFit.contain),
            ),
            ..._bikes.map((bike) {
              final loc = bike['location'] as LatLng;
              final isInUse = bike['isInUse'] as bool;
              return Marker(
                point: loc,
                width: 48,
                height: 48,
                child: Image.asset(
                  isInUse ? 'lib/assets/images/marker-car-InUse.png' : 'lib/assets/images/marker-car-inactive.png',
                  fit: BoxFit.contain,
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
