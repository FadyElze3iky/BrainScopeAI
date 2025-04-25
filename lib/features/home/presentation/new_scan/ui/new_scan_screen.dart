import 'package:flutter/material.dart';
import 'package:BrainScopeAI/features/home/presentation/new_scan/ui/widgets/new_scan_body.dart';

class NewScanScreen extends StatelessWidget {
  const NewScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Scan'),
        ),
        body: NewScanBody(),
      ),
    );
  }
}
