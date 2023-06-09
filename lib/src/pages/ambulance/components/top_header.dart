import 'package:ambulance/src/global/global.dart';
import 'package:ambulance/src/pages/cpr/cpr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopHeader extends StatefulWidget {
  //final GlobalKey<ScaffoldState> keys;
  const TopHeader({
    Key? key,
    // required this.keys,
  }) : super(key: key);

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      bottom: size.height - 400,
      left: 0,
      right: 0,
      child: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: foregroundColor,
          // height: 800,
          // width: 600,
          // height: size.height * 0.3,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 130.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ambulance",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                const SizedBox(width: 80),
                IconButton(
                  onPressed: () {
                    Get.to(() => const CprPage());
                  },
                  icon: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // ignore: unused_local_variable
    Paint paint0 = Paint();
    paint0.color = Colors.red;
    // final height = size.height;
    // final width = size.width;
    // ..style = PaintingStyle.stroke
    // ..strokeWidth = 1;

    // Path path0 = Path();
    // path0.moveTo(0,0);
    // path0.lineTo(0,size.height*0.3651095);
    // path0.quadraticBezierTo(size.width*0.0066000,size.height*0.2678589,size.width*0.0387333,size.height*0.2672019);
    // path0.quadraticBezierTo(size.width*0.1345000,size.height*0.2665937,size.width*0.4166667,size.height*0.2669586);
    // path0.quadraticBezierTo(size.width*0.8298167,size.height*0.2706083,size.width*0.9669000,size.height*0.2712165);
    // path0.quadraticBezierTo(size.width*0.9992333,size.height*0.2681752,size.width,size.height*0.3596107);
    // path0.lineTo(size.width,0);
    // path0.lineTo(0,0);

    // Path path0 = Path();
    // path0.moveTo(0, 0);
    // path0.lineTo(0, size.height * 0.3651095);
    // path0.quadraticBezierTo(size.width * -0.0029167, size.height * 0.2708759,
    //     size.width * 0.0377833, size.height * 0.2616545);
    // path0.cubicTo(
    //     size.width * 0.0953667,
    //     size.height * 0.2584672,
    //     size.width * 0.2069500,
    //     size.height * 0.2618248,
    //     size.width * 0.2604833,
    //     size.height * 0.2614112);
    // path0.cubicTo(
    //     size.width * 0.4389833,
    //     size.height * 0.2628224,
    //     size.width * 0.8288667,
    //     size.height * 0.2678345,
    //     size.width * 0.9659500,
    //     size.height * 0.2684428);
    // path0.quadraticBezierTo(size.width * 1.0011333, size.height * 0.2764964,
    //     size.width, size.height * 0.3596107);
    // path0.lineTo(size.width, 0);
    // path0.lineTo(0, 0);
    // path0.lineTo(size.width * 0.1016667, size.height * 0.3479319);

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height * 0.4975000);
    path0.quadraticBezierTo(size.width * 0.0129167, size.height * 0.3781250,
        size.width * 0.0816667, size.height * 0.3750000);
    path0.cubicTo(
        size.width * 0.2902083,
        size.height * 0.3753125,
        size.width * 0.7072917,
        size.height * 0.3759375,
        size.width * 0.9158333,
        size.height * 0.3762500);
    path0.quadraticBezierTo(size.width * 0.9893833, size.height * 0.3800000,
        size.width, size.height * 0.4962500);
    path0.lineTo(size.width, 0);

    // canvas.drawPath(path0, paint0);
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
