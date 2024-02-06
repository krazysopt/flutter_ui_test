import 'package:flutter/material.dart';

class PageItem {
  static const String home = 'Home';
  static const String services = 'Services';
  static const String myOrders = 'My Orders';
  static const String myAccounts = 'My Account';

  /// display label
  final String label;

  /// icon data
  final IconData icon;

  /// page item model
  const PageItem({
    required this.label,
    required this.icon,
  });
}