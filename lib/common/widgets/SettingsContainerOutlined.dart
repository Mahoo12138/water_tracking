import 'package:flutter/material.dart';
import 'package:water_tracking/common/widgets/Text.dart';
import 'package:water_tracking/foundation/extensions/context_ext.dart';

import 'Tappable.dart';

class SettingsContainerOutlined extends StatelessWidget {
  const SettingsContainerOutlined({
    Key? key,
    required this.title,
    this.description,
    this.icon,
    this.afterWidget,
    this.onTap,
    this.onLongPress,
    this.verticalPadding,
    this.horizontalPadding,
    this.iconSize,
    this.iconScale,
    this.isExpanded = true,
    this.isOutlinedColumn,
    this.isWideOutlined,
  }) : super(key: key);

  final String title;
  final String? description;
  final IconData? icon;
  final Widget? afterWidget;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? iconSize;
  final double? iconScale;
  final bool isExpanded;
  final bool? isOutlinedColumn;
  final bool? isWideOutlined;

  @override
  Widget build(BuildContext context) {
    double defaultIconSize = 25;
    Widget content;
    if (isOutlinedColumn == true) {
      content = Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            // color: (appStateSettings["materialYou"]
            //     ? Theme.of(context).colorScheme.secondary.withOpacity(0.5)
            //     : getColor(context, "lightDarkAccentHeavy")),
            width: 2,
          ),
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        padding: EdgeInsetsDirectional.only(
          start: horizontalPadding ?? 3,
          end: horizontalPadding ?? 3,
          top: verticalPadding ?? 14,
          bottom: verticalPadding ?? 14,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null
                ? SizedBox.shrink()
                : Transform.scale(
                    scale: iconScale ?? 1,
                    child: Icon(
                      icon,
                      size: iconSize ?? defaultIconSize + 5,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
            SizedBox(height: 10),
            TextFont(
              text: title,
              fontSize: 13,
              textColor: context.getColor("black").withOpacity(0.8),
              maxLines: 2,
              autoSizeText: true,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    } else {
      Widget textContent = description == null
          ? TextFont(
              fixParagraphMargin: true,
              text: title,
              fontSize: isExpanded == false ? 16 : 14.5,
              maxLines: 1,
              overflow: TextOverflow.clip,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFont(
                  fixParagraphMargin: true,
                  text: title,
                  fontSize: 16,
                  maxLines: 1,
                ),
                Container(height: 3),
                TextFont(
                  text: description!,
                  fontSize: 11,
                  maxLines: 5,
                  textColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  // textColor: appStateSettings["increaseTextContrast"]
                  //     ? getColor(context, "textLight")
                  //     : Theme.of(context)
                  //         .colorScheme
                  //         .secondary
                  //         .withOpacity(0.5),
                ),
              ],
            );
      content = Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            // color: (appStateSettings["materialYou"]
            //     ? Theme.of(context).colorScheme.secondary.withOpacity(0.5)
            //     : getColor(context, "lightDarkAccentHeavy")),
            width: 2,
          ),
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        padding: EdgeInsetsDirectional.only(
          start: horizontalPadding ?? 13,
          end: horizontalPadding ?? 4,
          top: verticalPadding ?? 14,
          bottom: verticalPadding ?? 14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize:
              isExpanded == false ? MainAxisSize.min : MainAxisSize.max,
          children: [
            icon == null
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsetsDirectional.only(
                        end: 8 +
                            defaultIconSize -
                            (iconSize ?? defaultIconSize)),
                    child: Transform.scale(
                      scale: iconScale ?? 1,
                      child: Icon(
                        icon,
                        size: iconSize ?? defaultIconSize,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
            isWideOutlined == true ? SizedBox(width: 3) : SizedBox.shrink(),
            isExpanded
                ? Expanded(child: textContent)
                : Flexible(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: textContent,
                    ),
                  ),
            afterWidget ?? SizedBox()
          ],
        ),
      );
    }
    return Tappable(
      onLongPress: onLongPress,
      color: Colors.transparent,
      onTap: onTap,
      borderRadius: 10,
      child: content,
    );
  }
}
