import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/widgets/logo_widget.dart';

class LoadingWidget extends StatelessWidget {
  final bool loading;
  final String text;
  final bool debugBanner;
  LoadingWidget(
    this.loading, {
    this.text = 'Loading...',
    this.debugBanner = true,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            color: Color(0x7FFFFFFF),
            width: Get.width,
            height: Get.height,
            child: _getCenter(text, true, debugBanner),
          )
        : _getCenter(text, false, debugBanner);
  }
}

Widget _getCenter(String text, bool animate, bool debugBanner) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoWidget(
            size: 90,
            animate: animate,
            debugBanner: debugBanner,
          ),
          SizedBox(
            height: 20,
          ),
          Text(text),
        ],
      ),
    );
