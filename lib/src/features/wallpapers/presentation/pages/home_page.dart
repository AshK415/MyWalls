import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mywalls/src/features/wallpapers/wallpapers.dart';
import 'package:mywalls/src/shared/theme/app_theme.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesRef = ref.watch(wallpaperProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyWalls'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(appThemeModeProvider.notifier).toggle();
            },
            icon: const Icon(Icons.brightness_medium_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: imagesRef.when(
          data: (images) {
            if (images.feeds.isEmpty) {
              return const Center(
                child: Text('No wallpapers!!'),
              );
            }
            final feeds = images.feeds;
            return MasonryGridView.builder(
              itemCount: feeds.length,
              mainAxisSpacing: 6,
              crossAxisSpacing: 8,
              physics: const BouncingScrollPhysics(),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (c, i) {
                return Stack(
                  children: [
                    Hero(
                      tag: feeds[i].id,
                      child: Material(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: Colors.black26,
                        clipBehavior: Clip.antiAlias,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: (i % 5 + 1) * 100,
                            imageUrl: feeds[i].urls.regular,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          stops: const [0, 0.4, 0.6, 1],
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.4)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      height: (i % 5 + 1) * 100,
                    ),
                  ],
                );
              },
            );
          },
          error: (_, __) => const Center(
            child: Text('Got some error while fetching wallpapers!!!'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
