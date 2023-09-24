import 'package:flutter/material.dart';

@immutable
abstract class TabbingEvent {

}
class TabChange extends TabbingEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}