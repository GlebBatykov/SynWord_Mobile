part of poseidon;

class PoseidonRoute<A extends PoseidonArguments> {
  final String path;

  final Route Function(BuildContext, A) _builder;

  PoseidonRoute(
      {required this.path, required Route Function(BuildContext, A) builder})
      : _builder = builder;

  Route build(BuildContext context, {A? arguments}) {
    return _builder(context, arguments ?? PoseidonArguments() as A);
  }
}
