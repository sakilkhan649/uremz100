import 'package:flutter/material.dart';

import '../../../Widgets/Custom_AppBar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Discover", showBackButton: true),

    );
  }
}
