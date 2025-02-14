import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:water_tracking/database/entities/record.dart';

import 'package:water_tracking/database/beverage_db.dart';
import 'package:water_tracking/database/record_db.dart';
import 'package:water_tracking/router/app_routes.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    Future<void> test() async {
      final recordDB = RecordDB();
      final beverageDB = BeverageDB();

      // 添加记录
      final record = Record()
        ..amountML = 200
        ..beverageName = "Water";
      await recordDB.save(record);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320,
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: context.tr("startTitle1")),
                      TextSpan(
                          text: context.tr("startTitle2"),
                          style: TextStyle(color: colorScheme.primary)),
                    ],
                    style: textStyle.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 320,
              padding: const EdgeInsets.all(10.0),
              child: Text(
                context.tr("startTitle3"),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                width: 320,
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: context.tr("welcome1")),
                    TextSpan(
                        text: context.tr("welcome2"),
                        style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // logic.toPrivacy();
                          }),
                    TextSpan(text: context.tr("welcome3")),
                    TextSpan(
                        text: context.tr("welcome4"),
                        style: TextStyle(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // logic.toAgreement();
                          }),
                    TextSpan(text: context.tr("welcome5"))
                  ], style: textStyle.bodyLarge),
                )),
            Container(
              width: 320,
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton.tonal(
                      onPressed: () {
                        exit(0);
                      },
                      child: Text(context.tr("startChoice1"))),
                  FilledButton(
                      onPressed: () {
                        // logic.toHome();
                        // context.go(AppRoute.home.route);
                        context.go(AppRoute.onboarding.route);

                      },
                      child: Text(context.tr("startChoice2"))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
