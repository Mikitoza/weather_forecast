import 'package:flutter/material.dart';

extension ParseIconIdToIcon on String {
  IconData parseIcon() {
    switch (this) {
      case '01d':
        return Icons.wb_sunny_outlined;
      case '02d':
        return Icons.cloud;
      case '03d':
        return Icons.cloud;
      case '04d':
        return Icons.cloud;
      case '09d':
        return Icons.water_drop_outlined;
      case '10d':
        return Icons.water_drop_outlined;
      case '11d':
        return Icons.flash_on_outlined;
      case '13d':
        return Icons.cloudy_snowing;
      case '50d':
        return Icons.reorder;
      case '01n':
        return Icons.wb_sunny_outlined;
      case '02n':
        return Icons.cloud;
      case '03n':
        return Icons.cloud;
      case '04n':
        return Icons.cloud;
      case '09n':
        return Icons.water_drop_outlined;
      case '10n':
        return Icons.water_drop_outlined;
      case '11n':
        return Icons.flash_on_outlined;
      case '13n':
        return Icons.cloudy_snowing;
      case '50n':
        return Icons.reorder;
      default:
        return Icons.wb_sunny_outlined;
    }
  }
}
