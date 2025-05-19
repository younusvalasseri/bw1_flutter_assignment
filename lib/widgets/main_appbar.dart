import 'package:bw1_flutter_assignment/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'location_provider.dart';

class MainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsyncValue = ref.watch(locationProvider);

    return AppBar(
      backgroundColor: kWhitColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const Icon(Icons.location_on, color: kGreenColor),
          const SizedBox(width: 5),
          locationAsyncValue.when(
            data:
                (location) => Text(
                  location,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            loading:
                () => const Text(
                  "Fetching location...",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
            error:
                (err, _) => const Text(
                  "Location error",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
          ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: kGreenColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
