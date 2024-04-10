import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/theme/app_theme.dart';

mixin ModalBottom {

  static Future show(
      BuildContext context, {
        required Widget view,
      }) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: appTheme.black900,
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return view;
      },
    );
  }

  static Future showWithTopBar(
    BuildContext context, {
    required Widget view,
    required String title,
  }) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: appTheme.black900,
      enableDrag: true,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      builder: (context) {
        return ModalTopBar(
          title: title,
          view: view,
        );
      },
    );
  }
}

class ModalTopBar extends StatelessWidget {
  final String title;
  final Widget view;

  const ModalTopBar({
    super.key,
    required this.title,
    required this.view,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.93,
      initialChildSize: 0.93,
      builder: (context, scrollController) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            theme.colorScheme.onPrimaryContainer.withOpacity(1),
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(Icons.close, color: Colors.white,),
                    ),
                  ],
                ),
              ),
              Divider(
                color: theme.colorScheme.onPrimaryContainer,
              ),
              Expanded(child: view)
            ],
          ),
        );
      },
    );
  }
}
