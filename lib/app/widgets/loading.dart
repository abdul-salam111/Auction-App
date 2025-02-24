import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;

  const LoadingIndicator({
    Key? key,
    this.size = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: Platform.isAndroid
            ? CircularProgressIndicator(
                strokeWidth: 4,
                color: Theme.of(context).progressIndicatorTheme.color,
              )
            : CupertinoActivityIndicator(
                radius: size / 2,
                color: Theme.of(context).progressIndicatorTheme.color,
              ),
      ),
    );
  }
}
