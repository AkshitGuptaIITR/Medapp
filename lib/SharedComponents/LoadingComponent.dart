import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;

  LoadingWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 16.0),
            if (message != null)
              Text(message!, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
