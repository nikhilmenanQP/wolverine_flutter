import 'package:responsive_builder/responsive_builder.dart';

double getResponsiveSize({
  required SizingInformation sizingInfo,
  required double mobile,
  double? tablet,
  double? desktop,
}) {
  switch (sizingInfo.deviceScreenType) {
    case DeviceScreenType.desktop:
      return desktop ?? tablet ?? mobile;
    case DeviceScreenType.tablet:
      return tablet ?? mobile;
    case DeviceScreenType.mobile:
    default:
      return mobile;
  }
}
