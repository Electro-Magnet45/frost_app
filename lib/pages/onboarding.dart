import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frost/constants.dart';

class OnBoarding extends HookWidget {
  const OnBoarding({Key? key}) : super(key: key);

  double getPercentage(int i) {
    if (i == 3) return 1;
    double per = ((i + 1) / 4) * 100;
    return double.parse('.' + per.toString().replaceAll(".", ""));
  }

  @override
  Scaffold build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final ValueNotifier<int> currentIndex = useState<int>(0);
    final PageController pageController = usePageController();

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      child: DefaultTextStyle(
        style: const TextStyle(fontFamily: 'ComicNeue', color: Colors.black),
        child: Stack(children: <Widget>[
          PageView(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int page) => currentIndex.value = page,
              children: onboards
                  .map<OnBoardScreen>(
                      (Map e) => OnBoardScreen(size: _size, item: e))
                  .toList()),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 140),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < onboards.length; i++)
                        if (i == currentIndex.value) ...[progress(true)] else
                          progress(false)
                    ]),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 29),
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                      begin: 0.0, end: getPercentage(currentIndex.value)),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, value, _) => SizedBox(
                      height: 84,
                      width: 84,
                      child: CircularProgressIndicator(
                          value: value, color: primaryColor)),
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex.value == 3) {
                        Navigator.pushNamed(context, '/welcome');
                      } else {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 900),
                            curve: Curves.ease);
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color(0XFFF3328E), shape: BoxShape.circle),
                        child: const Icon(Icons.arrow_right_alt,
                            color: Colors.white, size: 42)),
                  ))),
        ]),
      ),
    ));
  }

  AnimatedContainer progress(bool enable) {
    return AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        duration: const Duration(milliseconds: 500),
        height: 10,
        width: enable ? 20 : 10,
        decoration: BoxDecoration(
            color: enable ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(20)));
  }
}

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key, required this.size, required this.item})
      : super(key: key);
  final Size size;
  final Map item;

  @override
  Column build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: size.height / 10),
      SvgPicture.asset('assets/${item['img']}.svg',
          width: size.width - 24, height: size.height / 2),
      const SizedBox(height: 40),
      Text(item['title'],
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: primaryColor)),
      const SizedBox(height: 20),
      const Spacer()
    ]);
  }
}
