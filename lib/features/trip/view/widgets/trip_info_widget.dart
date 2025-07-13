import 'package:_3la_ad_el_eed/features/trip/view/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TripInfoWidget extends StatelessWidget {
  final String distance;
  final IconData distanceIcon;
  final String duration;
  final IconData durationIcon;
  const TripInfoWidget({
    super.key,
    required this.distance,
    required this.distanceIcon,
    required this.duration,
    required this.durationIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 10,
      right: 10,
      child: Row(
        children: [
          Expanded(child: CustomContainer(text: distance, icon: distanceIcon)),
          SizedBox(width: 7),
          Expanded(child: CustomContainer(text: duration, icon: durationIcon)),
        ],
      ),
    );
  }
}
