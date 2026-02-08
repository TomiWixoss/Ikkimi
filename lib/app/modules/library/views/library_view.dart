import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Library View - Coming Soon'),
      ),
    );
  }
}
