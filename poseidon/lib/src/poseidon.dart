part of poseidon;

class Poseidon {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<PoseidonRoute> _routes = [];

  Future<void> navigate<A extends PoseidonArguments>(String path,
      {PoseidonArguments? arguments}) {
    if (_routes.where((element) => element.path == path).isNotEmpty) {
      var poseidonRoute = _routes.firstWhere((element) => element.path == path);

      var route = poseidonRoute.build(navigationKey.currentContext!,
          arguments: arguments);

      return navigationKey.currentState!.push(route);
    } else {
      throw PoseidonException();
    }
  }

  void pop() {
    navigationKey.currentState!.pop();
  }

  void createRoute({required PoseidonRoute route}) {
    if (_routes.where((element) => element.path == route.path).isEmpty) {
      _routes.add(route);
    } else {
      throw PoseidonException();
    }
  }

  void createRoutes({required List<PoseidonRoute> routes}) {
    for (var route in routes) {
      createRoute(route: route);
    }
  }

  void removeRoute(String path) {
    _routes.removeWhere((element) => element.path == path);
  }

  void showSnackBar(SnackBar snackBar) {
    scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  Future<T?> callDialog<T>(Widget Function(BuildContext) builder) async {
    return await showDialog<T>(
        context: scaffoldKey.currentContext!, builder: builder);
  }
}
