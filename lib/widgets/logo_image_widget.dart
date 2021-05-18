import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_test/config/constants.dart';
import 'package:getx_test/core/services/app_service.dart';

class LogoImageWidget extends StatelessWidget {
  final AppService _appService = Get.find<AppService>();

  final bool debugBanner;
  final double size;

  LogoImageWidget(this.size, this.debugBanner);

  @override
  Widget build(BuildContext context) {
    final _configLogo = _appService.box().read('logoPath');
    final _configLogoType = _appService.box().read('logoType');

    return debugBanner
        ? Stack(
            children: [
              _getImage(size, _configLogo, _configLogoType),
              Positioned(
                bottom: size / 2 - 6,
                right: 0,
                left: 0,
                child: Container(
                  height: 12,
                  width: size,
                  color: Color(0xA0B71C1C),
                  padding: EdgeInsets.only(top: 1),
                  child: Center(
                    child: Text(
                      'DEBUG',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12 * 0.85,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : _getImage(size, _configLogo, _configLogoType);
  }
}

Widget _getImage(double size, String? logo, String? logoType) {
  if (logo != null) {
    return logoType != null && logoType == 'svg'
        ? SvgPicture.network(
            logo,
            width: size,
            height: size,
          )
        : Image.network(
            logo,
            height: size,
            width: size,
          );
  }

  return LOGO_TYPE == 'svg'
      ? SvgPicture.asset(
          LOGO_PATH,
          height: size,
          width: size,
        )
      : Image.asset(
          LOGO_PATH,
          height: size,
          width: size,
        );
}
