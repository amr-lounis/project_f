import 'package:flutter/material.dart';
///////////////////////////////////////////////////////////////////////////////
class ProgressBarWidget extends StatelessWidget {
  final status;
  final child;
  ProgressBarWidget({this.status,this.child});
  @override
  Widget build(BuildContext cntxt) {
    return status == true ? Center(child: CircularProgressIndicator()):child;
  }
}
