import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mywalls/src/features/wallpapers/wallpapers.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesRef = ref.watch(wallpaperProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: imagesRef.when(
            data: (images) {
              if (images.isEmpty) {
                return const Center(
                  child: Text('No wallpapers!!'),
                );
              }
              return ListView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  itemBuilder: (c, i) => ListTile(
                        title: Text(images[i].id),
                      ));
            },
            error: (_, __) => const Center(
                  child: Text('Got some error while fetching wallpapers!!!'),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
