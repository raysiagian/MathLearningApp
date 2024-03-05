import 'package:flutter/material.dart';
import 'package:projectapp/models/onboarding.dart';
import 'package:projectapp/pages/auth/login.dart';
import 'package:projectapp/pages/home.dart';
import 'package:projectapp/widget/onboarding/lewati_button.dart';
import 'package:projectapp/widget/onboarding/onboarding_page_widget.dart';
import 'package:projectapp/widget/onboarding/selanjutnyaonboarding_button.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({Key? key}) : super(key: key);

  @override
  State<OnboardingPages> createState() => _OnboardingPages();
}

class _OnboardingPages extends State<OnboardingPages> {
  final List<Onboarding> listOnboarding = Onboarding.listOnboarding;
  final _pageController = PageController();
  bool _hasReachEnd = false;
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // tambah logika ketika page berubah
      
      if (_pageController.page!.toInt() == listOnboarding.length - 1) {
        setState(() {
          _hasReachEnd = true;
        });
      }else {
        setState(() {
          _hasReachEnd = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_hasReachEnd)
              Align(
                alignment: Alignment.centerRight,
                child: FutureBuilder(
                  future: Future.delayed(
                    const Duration(milliseconds: 300),
                  ),
                  builder: (context, snapshot) {
                    final hasDone =
                        snapshot.connectionState == ConnectionState.done;
                    return hasDone
                        ? Padding(
                            padding: const EdgeInsets.only(right: 15, top: 15),
                            child: LewatiButton(
                              onPressed: () {
                                final lastIndex = listOnboarding.length - 1;
                                if(lastIndex >= 0){
                                  _pageController.jumpToPage(lastIndex);
                                }
                                // _pageController
                                //     .jumpToPage(listOnboarding.length - 1);
                              },
                            ))
                        : SizedBox.shrink();
                  },
                ),
              ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: listOnboarding.length,
                itemBuilder: (context, index) {
                  return OnboardingWidget(onboarding: listOnboarding[index]);
                },
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SelanjutnyaOnboardingButton(
                onboardingSelanjutnya: () {
                  if (_pageController.page!.toInt() >=
                      listOnboarding.length - 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  } else {
                    _pageController.nextPage(
                        duration: Duration(microseconds: 300),
                        curve: Curves.ease);
                  }
                },
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
