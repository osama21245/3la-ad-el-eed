import 'package:flutter/material.dart';


class CenterPoint extends StatelessWidget {
  const CenterPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center( child: Container(
      
      padding: EdgeInsets.only(bottom: 45),
      height:95,
      width: 60,
      child: Image.asset("assets/images/marker_icon.png",)));
  }
}
