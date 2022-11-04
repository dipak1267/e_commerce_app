import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/consts/assets.dart';
import 'package:portfolio_app/main.dart';
import 'package:portfolio_app/theme/themed_text.dart';
import 'package:portfolio_app/theme/themes.dart';
import 'package:portfolio_app/ui/common/commons.dart';
import 'package:portfolio_app/ui/widgets/app_logo.dart';
import 'package:portfolio_app/ui/widgets/app_page_indicator.dart';
import 'package:portfolio_app/ui/widgets/buttons/circle_button.dart';
import 'package:portfolio_app/utils/app_extention.dart';
import 'package:portfolio_app/utils/app_haptics.dart';
import 'package:portfolio_app/utils/route_manager.dart';
import 'package:portfolio_app/utils/spring_curver.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static const double _imageSize = 264;
  static const double _logoHeight = 150;
  static const double _textHeight = 155;
  static const double _pageIndicatorHeight = 55;
  RxDouble yOffset = 0.25.obs;
  static List<_PageData> pageData = [];

  late final PageController _pageController = PageController()
    ..addListener(_handlePageChanged);
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Timer(Duration.zero, () {
      yOffset.value = -0.08;
    });
    // Set the page data, as strings may have changed based on locale
    pageData = [
      _PageData(appStrings.introTitleFirst, appStrings.introDescriptionFirst,
          '1', '1'),
      _PageData(appStrings.introTitleSecond, appStrings.introDescriptionSecond,
          '2', '2'),
      _PageData(appStrings.introTitleThird, appStrings.introDescriptionThird,
          '3', '3'),
    ];

    // This view uses a full screen PageView to enable swipe navigation.
    // However, we only want the title / description to actually swipe,
    // so we stack a PageView with that content over top of all the other
    // content, and line up their layouts.
    super.initState();
  }

  void _handleIntroCompletePressed() {
    if (_currentPage.value == pageData.length - 1) {
      // logic for end intro
      RouteManager.navigateOff(RouteManager.signInScreen);
    }
  }

  void _handlePageChanged() {
    int newPage = _pageController.page?.round() ?? 0;
    _currentPage.value = newPage;
  }

  void _handleSemanticSwipe(int dir) {
    _pageController.animateToPage((_pageController.page ?? 0).round() + dir,
        duration: $styles.times.fast, curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
// This view uses a full screen PageView to enable swipe navigation.
    // However, we only want the title / description to actually swipe,
    // so we stack a PageView with that content over top of all the other
    // content, and line up their layouts.

    final List<Widget> pages = pageData.map((e) => _Page(data: e)).toList();
    final Widget content = Stack(children: [
      // page view with title & description:
      MergeSemantics(
        child: Semantics(
          onIncrease: () => _handleSemanticSwipe(1),
          onDecrease: () => _handleSemanticSwipe(-1),
          child: PageView(
            controller: _pageController,
            children: pages,
            onPageChanged: (_) => AppHaptics.lightImpact(),
          ),
        ),
      ),

      IgnorePointer(
          ignoringSemantics: false,
          child: Column(
            children: [
              const Spacer(),
              // logo:
              Obx(() {
                return AnimatedSlide(
                  offset: Offset(0, yOffset.value),
                  duration: const Duration(milliseconds: 2000),
                  curve: const SpringCurve(),
                  child: Semantics(
                    header: true,
                    child: Container(
                      height: _logoHeight,
                      alignment: Alignment.center,
                      child: AppLogo(),
                    ),
                  ),
                );
              }),
              // masked image:
              SizedBox(
                height: _imageSize,
                width: _imageSize,
                child: ValueListenableBuilder<int>(
                  valueListenable: _currentPage,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: $styles.times.slow,
                      child: KeyedSubtree(
                        key: ValueKey(value),
                        // so AnimatedSwitcher sees it as a different child.
                        child: _PageImage(data: pageData[value]),
                      ),
                    );
                  },
                ),
              ),
              // placeholder for text:
              (_IntroScreenState._textHeight).addHSpace(),

              // page indicator:
              Container(
                height: _pageIndicatorHeight,
                alignment: const Alignment(0.0, -0.75),
                child: AppPageIndicator(
                    count: pageData.length,
                    controller: _pageController,
                    color: $styles.colors.offWhite),
              ),

              const Spacer(flex: 2),
            ],
          )),
      // finish button:
      Positioned(
        right: $styles.insets.lg,
        bottom: $styles.insets.lg,
        child: _buildFinishBtn(context),
      ),

      // nav help text:
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: $styles.insets.lg),
          child: _buildNavText(context),
        ),
      ),
    ]);

    return Scaffold(
      body: DefaultTextColor(
        color: $styles.colors.offWhite,
        child: Container(
          color: $styles.colors.black,
          child: SafeArea(child: content
              // .animate().fadeIn(delay: 500.ms)
              ),
        ),
      ),
    );
  }

  Widget _buildFinishBtn(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPage,
      builder: (_, pageIndex, __) {
        return AnimatedOpacity(
          opacity: pageIndex == pageData.length - 1 ? 1 : 0,
          duration: $styles.times.fast,
          child: CircleIconBtn(
            icon: Icons.arrow_forward_outlined,
            bgColor: $styles.colors.accent1,
            onPressed: _handleIntroCompletePressed,
            semanticLabel: '',
          ),
        );
      },
    );
  }

  Widget _buildNavText(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentPage,
      builder: (_, pageIndex, __) {
        return AnimatedOpacity(
          opacity: pageIndex == pageData.length - 1 ? 0 : 1,
          duration: $styles.times.fast,
          child: Semantics(
            onTapHint: appStrings.introSemanticSwipeLeft,
            onTap: () {
              final int current = _pageController.page!.round();
              _pageController.animateToPage(current + 1,
                  duration: 250.ms, curve: Curves.easeIn);
            },
            child: (appStrings.introSemanticSwipeLeft).appBodySmallText(),
          ),
        );
      },
    );
  }
}

@immutable
class _PageData {
  const _PageData(this.title, this.desc, this.img, this.mask);

  final String title;
  final String desc;
  final String img;
  final String mask;
}

class _Page extends StatelessWidget {
  const _Page({Key? key, required this.data}) : super(key: key);

  final _PageData data;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      child: Column(children: [
        const Spacer(),
        (_IntroScreenState._imageSize + _IntroScreenState._logoHeight)
            .addSpace(),
        SizedBox(
          height: _IntroScreenState._textHeight,
          width: _IntroScreenState._imageSize + $styles.insets.md,
          child: StaticTextScale(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                data.title.appTittleText(),
                ($styles.insets.sm).addSpace(),
                data.desc.appBodyText(),
              ],
            ),
          ),
        ),
        (_IntroScreenState._pageIndicatorHeight).addSpace(),
        const Spacer(flex: 2),
      ]),
    );
  }
}

class _PageImage extends StatelessWidget {
  const _PageImage({Key? key, required this.data}) : super(key: key);

  final _PageData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        '${ImagePaths.intro}intro_${data.img}.png',
        fit: BoxFit.cover,
        alignment: Alignment.centerRight,
      ),
    );
  }
}
