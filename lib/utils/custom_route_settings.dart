import 'package:flutter/material.dart';

RouteSettings customRouteSettings({String name, String className}) =>
    RouteSettings(name: name, arguments: {'className': className});
