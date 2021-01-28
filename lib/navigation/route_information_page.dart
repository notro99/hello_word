import 'package:hello_word_android_studio/navigation/route_path.dart';
import 'package:flutter/material.dart';

class ProfileRouteInformationParser
    extends RouteInformationParser<ProfileRoutePath> {
  @override
  Future<ProfileRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // Kezdő oldal
    if (uri.pathSegments.length == 0) {
      return ProfileRoutePath.home();
    }

    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'profile') {
      return ProfileRoutePath.profile();
    }

    // Ismeretlen útvonal
    return ProfileRoutePath.unknown();
  }

  // Saját belső útvonal reprezentációnk alapján állítja elő az
  // útvonal információkat. Web-es platform esetén használatos.
  @override
  RouteInformation restoreRouteInformation(ProfileRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isProfile) {
      return RouteInformation(location: '/profile');
    }

    return null;
  }
}
