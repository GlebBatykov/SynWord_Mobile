part of poseidon;

class Poseidon {
  static final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey();

  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  static final List<PoseidonRoute> _routes = [];

  Poseidon._();

  static Future<void> navigate<A extends PoseidonArguments>(String path,
      {PoseidonArguments? arguments}) {
    if (_routes.where((element) => element.path == path).isNotEmpty) {
      var poseidonRoute = _routes.firstWhere((element) => element.path == path);

      var route = poseidonRoute.build(navigationKey.currentContext!,
          arguments: arguments);

      return navigationKey.currentState!.push(route);
    } else {
      throw PoseidonException(message: 'Poseidon has no route with this path.');
    }
  }

  static void pop() {
    navigationKey.currentState!.pop();
  }

  static void createRoute({required PoseidonRoute route}) {
    if (_routes.where((element) => element.path == route.path).isEmpty) {
      _routes.add(route);
    } else {
      throw PoseidonException(
          message: 'Poseidon already has route with this path.');
    }
  }

  static void createRoutes({required List<PoseidonRoute> routes}) {
    for (var route in routes) {
      createRoute(route: route);
    }
  }

  static void removeRoute(String path) {
    _routes.removeWhere((element) => element.path == path);
  }

  static void removeRoutes() {
    _routes.clear();
  }

  static void showSnackBar(SnackBar snackBar) {
    scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }

  static void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  static Future<T?> callDialog<T>(Widget Function(BuildContext) builder) async {
    return await showDialog<T>(
        context: scaffoldKey.currentContext!, builder: builder);
  }
}
