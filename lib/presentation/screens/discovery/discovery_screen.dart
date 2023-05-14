import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discovery/discovery_provider.dart';

import '../../widgets/video_scrollable_view.dart';

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoveryProvider = context.watch<DiscoveryProvider>();

    return Scaffold(
        body: discoveryProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : VideoScrollableView(videos: discoveryProvider.videos));
  }
}
