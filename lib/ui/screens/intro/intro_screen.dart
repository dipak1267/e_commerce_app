import 'package:flutter/material.dart';
import 'package:portfolio_app/extenstion/app_extention.dart';
import 'package:portfolio_app/extenstion/app_haptics.dart';
import 'package:portfolio_app/main.dart';
import 'package:portfolio_app/theme/theames.dart';
import 'package:portfolio_app/ui/common/commons.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static const double _imageSize = 264;
  static const double _logoHeight = 126;
  static const double _textHeight = 155;
  static const double _pageIndicatorHeight = 55;

  static List<_PageData> pageData = [];

  late final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // Set the page data, as strings may have changed based on locale
    pageData = [
      _PageData(appStrings.introTitleFirst, appStrings.introDescriptionFirst,
          'camel', '1'),
      _PageData(appStrings.introTitleSecond, appStrings.introDescriptionSecond,
          'petra', '2'),
      _PageData(appStrings.introTitleThird, appStrings.introDescriptionThird,
          'statue', '3'),
    ];

    // This view uses a full screen PageView to enable swipe navigation.
    // However, we only want the title / description to actually swipe,
    // so we stack a PageView with that content over top of all the other
    // content, and line up their layouts.
    super.initState();
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
            children: [],
          )),
      /*  // finish button:
      Positioned(
        right: $styles.insets.lg,
        bottom: $styles.insets.lg,
        child: _buildFinishBtn(context),
      ),

      // nav help text:
      BottomCenter(
        child: Padding(
          padding: EdgeInsets.only(bottom: $styles.insets.lg),
          child: _buildNavText(context),
        ),
      ),*/
    ]);

    return Container();
  }

/*  Widget _buildFinishBtn(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPage,
      builder: (_, pageIndex, __) {
        return AnimatedOpacity(
          opacity: pageIndex == pageData.length - 1 ? 1 : 0,
          duration: $styles.times.fast,
          child: CircleIconBtn(
            icon: AppIcons.next_large,
            bgColor: $styles.colors.accent1,
            onPressed: _handleIntroCompletePressed,
            semanticLabel: $strings.introSemanticEnterApp,
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
            onTapHint: appStrings.introSemanticNavigate,
            onTap: () {
              final int current = _pageController.page!.round();
              _pageController.animateToPage(current + 1,
                  duration: 250.ms, curve: Curves.easeIn);
            },
            child: Text($strings.introSemanticSwipeLeft,
                style: $styles.text.bodySmall),
          ),
        );
      },
    );
  }*/
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
                Text(
                  data.title,
                  // style: $styles.text.wonderTitle.copyWith(fontSize: 24)
                ),
                ($styles.insets.sm).addSpace(),
                Text(data.desc,
                    // style: $styles.text.body,
                    textAlign: TextAlign.center),
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
