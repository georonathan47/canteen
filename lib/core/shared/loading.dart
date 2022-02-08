import 'package:flutter/material.dart';
import 'package:test/core/constants/colors.dart';

class Loading extends StatelessWidget {
  final Widget child;
  final double opacity;
  final bool isAsyncCall;
  final Color color;
  final Animation<Color> valueColor;
  const Loading({
    Key key,
    @required this.child,
    @required this.isAsyncCall,
    this.color,
    this.opacity = 0.45,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetLsit = [];
    widgetLsit.add(child);
    if (isAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: const ModalBarrier(
              color: gold,
              dismissible: false,
            ),
          ),
          // ignore: prefer_const_constructors
          Center(
            child: const CircularProgressIndicator.adaptive(),
          ),
        ],
      );
      widgetLsit.add(modal);
    }
    return Stack(
      children: widgetLsit ,
    );
  }
}
