import 'package:flutter/material.dart';

class LocationListTiles extends StatelessWidget {
  const LocationListTiles({super.key,required this.onTap, required this.location});
  final void Function()? onTap;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          horizontalTitleGap: 0,
          leading: Icon(Icons.location_searching_rounded),
          title: Text(location, maxLines: 2, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
