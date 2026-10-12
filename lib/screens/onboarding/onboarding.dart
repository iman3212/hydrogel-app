import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogel/constant/padding.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/theme/button.dart';
import 'package:hydrogel/theme/colors.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

final PageController _pageController = PageController();

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;

  final List<String> images = [
    "assets/img/onboarding.png",
    "assets/img/onboarding2.png",
    "assets/img/onboarding3.png",
  ];

  final List<String> titles = [
    "Welcome to Ai Ink Assurance",
    "A detailed review of Bioink",
    "Full access to the Bioprinter"
  ];

  final List<String> contents = [
    "This app offers a range of features to help you manage your Moc Bioprint and Bioink with ease.You can communicate with the Moc Bioprinter directly, configure its basic settings, and even analyze the acidity and alkalinity levels of your Bioink",
    "One particularly useful feature is the ability to take a photo of your Bioink and view it in With this app, you'll have everything you need to get the most out of your  Bioink detail within the app .",
    "With this app, you'll have everything you need to get the most out of your Moc Bioprinter"
  ];

  final List<VoidCallback> buttonActions = [
    () => _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease),
    () => _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease),
    () => Get.offNamed(Routes.menu),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: ConstVariable.appSymmetricPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _pageController,
                itemCount: titles.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Expanded(
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      Text(
                        titles[index],
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            contents[index],
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.grey.shade600,
                                    ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDotIndicator(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: currentPage > 0
                            ? () => _pageController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease)
                            : null,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: LightThemeColor.primaryColor,
                        ),
                        label: const Text(
                          "Back",
                          selectionColor: LightThemeColor.primaryColor,
                        ),
                        style: ButtonStyles().secondaryButton,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                      ElevatedButton(
                        onPressed: () {
                          buttonActions[currentPage]();
                        },
                        style: ButtonStyles().onboardingButton,
                        child: Row(
                          children: [
                            Text(
                              "Next Page",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        titles.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
