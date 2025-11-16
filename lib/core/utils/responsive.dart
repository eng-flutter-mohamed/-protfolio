class Responsive {
  static const double mobile = 600;
  static const double tablet = 1024;

  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < tablet;
  static bool isDesktop(double width) => width >= tablet;

  static double horizontalPadding(double width) {
    if (width < mobile) return 18;
    if (width < tablet) return 28;
    if (width < 1400) return width * .07;
    return width * .08;
  }

  static int projectColumns(double width) => width >= 1300 ? 2 : 1;

  static double projectGap(int columns) => columns > 1 ? 24 : 0;

  static double projectItemWidth(double width, {double gap = 24}) {
    final columns = projectColumns(width);
    final effectiveGap = columns > 1 ? gap : 0;
    final totalSpacing = effectiveGap * (columns - 1);
    return (width - totalSpacing) / columns;
  }
}
