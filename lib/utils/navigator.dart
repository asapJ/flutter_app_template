import 'package:flutter/material.dart';

extension navigator on BuildContext {
  replaceWith(Widget route, {isDialog = false}) =>
      Router.replaceWith(this, route);

  navigateTo(Widget route, {isDialog = false}) =>
      Router.navigateTo(this, route);

  clearAllAndPush(Widget route) => Router.clearAllAndPush(this, route);

  popThis() => Router.popThis(this);

  pushDialog(Widget child) => Router.pushDialog(this, child);

  pushTransparentRoute(Widget route) =>
      Router.pushTransparentRoute(this, route);
}

class Router {
  Router._();

  static replaceWith(BuildContext context, Widget route, {isDialog = false}) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          fullscreenDialog: isDialog,
          builder: (context) => route,
        ),
      );

  static navigateTo(BuildContext context, Widget route, {isDialog = false}) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: isDialog,
          builder: (context) => route,
        ),
      );

  static clearAllAndPush(BuildContext context, Widget widget,
          {isDialog = false}) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            fullscreenDialog: isDialog,
            builder: (context) => widget,
          ),
          (Route<dynamic> r) => false);

  static popThis(BuildContext context) => Navigator.pop(context);

  static pushTransparentRoute(BuildContext context, Widget route) {
    return Navigator.push(
      context,
      TransparentRoute(
        builder: (context) => route,
      ),
    );
  }

  static Future<void> pushDialog(BuildContext context, Widget child) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Container(
              // height: 200,
              child: Dialog(
                clipBehavior: Clip.hardEdge,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                    child: child),
              ),
            ));
  }
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}
