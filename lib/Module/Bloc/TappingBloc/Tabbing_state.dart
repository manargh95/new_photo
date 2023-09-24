import 'package:flutter/material.dart';

@immutable
abstract class TabbingState {
  final int tabIndex;
  const TabbingState({required this.tabIndex});
}

class LoadPageInitial extends TabbingState {
  const LoadPageInitial({required super.tabIndex});

}


