import 'package:review_booking_web/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteConfig {
  static String get initRoute => '/review';

  static final _initPage = {
    // 'admin': '/transaction',
    // 'staff': '/transaction',
    // 'manager': '/transaction',
  };

  static final List<RouteToPage> _routeToPage = [
    RouteToPage(name: '/review', page: const ReviewScreen(), roles: [], checkAuth: false),
  ];

  List<RouteToPage> get getRouteToPage => _routeToPage;

  final List<GetPage> _route = _routeToPage
      .map((route) => GetPage(
          // name: route.name, page: () => route.name == '/login' || route.name == '/' ? route.page : const StaffScreen()))
          name: route.name,
          page: () => route.page))
      .toList();

  List<GetPage> get getRoute => _route;

  static String getPageInit(String role) {
    return _initPage[role] ?? '/login';
  }
}

class RouteToPage {
  final String name;
  final Widget page;
  final List<String> roles;
  final bool checkAuth;

  RouteToPage({required this.name, required this.page, required this.roles, this.checkAuth = true});
}
