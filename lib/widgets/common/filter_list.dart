import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_bee/providers/destination_provider.dart';
import 'package:travel_bee/themes/color_theme.dart';
import 'package:travel_bee/themes/font_theme.dart';

class FilterList extends ConsumerStatefulWidget {
  const FilterList(this.onTabClick, {super.key});

  final Function(String city) onTabClick;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilterListState();
}

class _FilterListState extends ConsumerState<FilterList> {
  int _activeTab = 0;

  _setActiveTab(int index, String city) {
    setState(() {
      _activeTab = index;
    });

    widget.onTabClick(city);
  }

  final _activeTabDecor = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(25),
        blurRadius: 8,
        spreadRadius: 2,
        offset: const Offset(0, 4),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(destinationProvider);

    return Container(
      padding: const EdgeInsets.all(4),
      height: 40,
      decoration: BoxDecoration(
        color: ColorTheme.backgroundGrey,
        borderRadius: BorderRadius.circular(24),
      ),
      child: data.when(
          data: (data) {
            final cities =
                data.map((destination) => destination.city).toSet().toList();

            return ListView.builder(
              itemCount: cities.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ConstrainedBox(
                  constraints:
                      // BoxConstraints(minWidth: _activeTab == index ? 100 : 0),
                      const BoxConstraints(minWidth: 100),
                  child: GestureDetector(
                    onTap: () {
                      _setActiveTab(index, cities[index]);
                    },
                    child: Container(
                      height: 36,
                      margin: const EdgeInsets.only(left: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: _activeTab == index ? _activeTabDecor : null,
                      child: Center(
                        child: Text(
                          cities[index],
                          style: FontTheme.subHeadingStyle
                              .copyWith(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          error: (err, stack) => Text('err'),
          loading: () => Text('Loading')),
      // child: Row(
      //   children: [
      //     ConstrainedBox(
      //       constraints: const BoxConstraints(minWidth: 100),
      //       child: Container(
      //         height: 36,
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 12,
      //           vertical: 8,
      //         ),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(24),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.black.withAlpha(25),
      //               blurRadius: 8,
      //               spreadRadius: 2,
      //               offset: const Offset(0, 4),
      //             ),
      //           ],
      //         ),
      //         child: Center(
      //           child: Text(
      //             'Karachi',
      //             style:
      //                 FontTheme.subHeadingStyle.copyWith(color: Colors.black87),
      //           ),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       width: 4,
      //     ),
      //     ConstrainedBox(
      //       constraints: const BoxConstraints(minWidth: 100),
      //       child: Container(
      //         height: 32,
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 12,
      //           vertical: 8,
      //         ),
      //         decoration: BoxDecoration(
      //           // color: Colors.white,
      //           borderRadius: BorderRadius.circular(24),
      //         ),
      //         child: Center(
      //           child: Text(
      //             'Islamabad',
      //             style:
      //                 FontTheme.subHeadingStyle.copyWith(color: Colors.black87),
      //           ),
      //         ),
      //       ),
      //     ),
      //     ConstrainedBox(
      //       constraints: const BoxConstraints(minWidth: 100),
      //       child: Container(
      //         height: 32,
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 12,
      //           vertical: 8,
      //         ),
      //         decoration: BoxDecoration(
      //           // color: Colors.white,
      //           borderRadius: BorderRadius.circular(24),
      //         ),
      //         child: Center(
      //           child: Text(
      //             'Lahore',
      //             style:
      //                 FontTheme.subHeadingStyle.copyWith(color: Colors.black87),
      //           ),
      //         ),
      //       ),
      //     ),
      //     ConstrainedBox(
      //       constraints: const BoxConstraints(minWidth: 100),
      //       child: Container(
      //         height: 32,
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 12,
      //           vertical: 8,
      //         ),
      //         decoration: BoxDecoration(
      //           // color: Colors.white,
      //           borderRadius: BorderRadius.circular(24),
      //         ),
      //         child: Center(
      //           child: Text(
      //             'Quetta',
      //             style:
      //                 FontTheme.subHeadingStyle.copyWith(color: Colors.black87),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
