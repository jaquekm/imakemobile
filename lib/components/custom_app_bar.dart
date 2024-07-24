import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imakemobile/components/widgets.dart';
import 'package:imakemobile/utils/color_palette.dart';
import 'package:imakemobile/utils/font_sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function? onBackTap;
  final bool showBackArrow;
  final Color? backgroundColor;
  final List<Widget>? actionWidgets;
  final bool centerTitle;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.centerTitle = false,
      this.onBackTap,
      this.showBackArrow = true,
      this.backgroundColor = kWhiteColor,
      this.actionWidgets});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: centerTitle,
      leading: showBackArrow
          ? IconButton(
              icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
              onPressed: () {
                if (onBackTap != null) {
                  onBackTap!();
                } else {
                  Navigator.of(context).pop();
                }
              },
            )
          : IconButton(
              icon: SvgPicture.asset('assets/svgs/horizontal_menu.svg'),
              onPressed: () {
                if (onBackTap != null) {
                  onBackTap!();
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
      actions: actionWidgets,
      title: Row(
        children: [
          buildText(title, kBlackColor, textMedium, FontWeight.w500,
              TextAlign.start, TextOverflow.clip),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
