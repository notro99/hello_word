import 'package:flutter/material.dart';
import 'package:hello_word_android_studio/navigation/route_path.dart';
import 'package:hello_word_android_studio/screens/home_screen.dart';
import 'package:hello_word_android_studio/screens/profile_page.dart';
import 'package:hello_word_android_studio/screens/unknown.dart';

class PathRouterDelegate extends RouterDelegate<ProfileRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ProfileRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey;

  bool show404 = false;
  bool showProfile = false;
  bool showCart = false;

  PathRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  ProfileRoutePath get currentConfiguration {
    if (show404) {
      return ProfileRoutePath.unknown();
    }
    if (showProfile) {
      return ProfileRoutePath.profile();
    }
  }

  // Ebben a metódusban rakjuk össze, hogyan épül fel a stack.
  // A pages tömb írja le, hogy mi szerepel a history-ban. Ha a tartalma
  // változik, akkor a rendszer összehasonlítja az előző állapottal és képernyőt
  // vált a megfelelő animáció kíséretében
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        // A HomePage mindig szereplni fog az oldalak között.
        MaterialPage(
          key: ValueKey('HomeScreen'),
          child: HomeScreen(
            onShowProfile: _handleShowProfile,
          ),
        ),
        // Ha ismeretlen oldalra tévedtünk, akkor az Unknown widget
        // fog megjelenni
        if (show404)
          MaterialPage(
            key: ValueKey('UnknownPage'),
            child: Unknown(),
          )
        else if (showProfile)
          MaterialPage(
            key: ValueKey('ProfilePage'),
            child: ProfilePage(),
          )
      ],
      // Akkor fut le, amikor kikerül egy elem a stack-ből.
      // Jelen esetben ez azt jelenti, hogy elhagytuk a Details widget-et,
      // így nincs kiválasztott pizzánk
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        show404 = false;
        showProfile = false;

        // A notifyListener meghívásával jelezhetjük a Router felé,
        // hogy változott a navigációs állapot és frissítenie kell
        // a megjelenítést
        notifyListeners();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  // Akkor fut le ha a rendszer szól az alkalmazásunknak, hogy egy új
  // útvonalat kell megjeleníteni, például, ha kézzel beírok egy URL-t a
  // böngészőbe.
  @override
  Future<void> setNewRoutePath(ProfileRoutePath path) async {
    if (path.isUnknown) {
      show404 = true;
      return;
    }

    if (path.isProfile) {
      showProfile = true;
    }

    show404 = false;
  }

  void _handleShowProfile() {
    showProfile = true;
    notifyListeners();
  }
}
