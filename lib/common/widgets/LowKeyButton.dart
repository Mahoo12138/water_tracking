import 'package:flutter/material.dart';
import 'package:water_tracking/common/widgets/Tappable.dart';
import 'package:water_tracking/common/widgets/Text.dart';
import 'package:water_tracking/foundation/extensions/context_ext.dart';
import 'package:water_tracking/utils/platform.dart';

class LowKeyButton extends StatelessWidget {
  const LowKeyButton({
    super.key,
    required this.onTap,
    required this.text,
    this.extraWidget,
    this.extraWidgetAtBeginning = false,
    this.color,
    this.textColor,
  });
  final VoidCallback onTap;
  final String text;
  final Widget? extraWidget;
  final bool extraWidgetAtBeginning;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Tappable(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        // color: color ??
        //     (appStateSettings["materialYou"]
        //         ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
        //         : getColor(context, "lightDarkAccent")),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (extraWidgetAtBeginning) extraWidget ?? SizedBox.shrink(),
              Flexible(
                child: TextFont(
                  text: text,
                  textAlign: TextAlign.center,
                  fontSize: 14,
                  textColor:
                      textColor ?? context.getColor("black").withOpacity(0.5),
                  maxLines: 5,
                ),
              ),
              if (extraWidgetAtBeginning == false)
                extraWidget ?? SizedBox.shrink(),
            ],
          ),
        ),
        onTap: onTap,
        borderRadius: isIOS() ? 8 : 13,
      ),
    );
  }
}
