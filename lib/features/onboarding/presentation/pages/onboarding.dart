import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:panda_test/shared/widgets/custom_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool isRussian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 110),
              Column(
                children: [
                  SvgPicture.asset('assets/icons/panda.svg', width: 240),
                  SizedBox(height: 36),
                  Text('Panda', style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Выберите язык приложения',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 36),

                  Row(
                    children: [
                      CustomButton(
                        type: isRussian ? CustomButtonType.bordered : CustomButtonType.filled,
                        label: "O’zbekcha",
                        onPressed: () {
                          setState(() {
                            isRussian = false;
                          });
                        },
                      ),
                      SizedBox(width: 16),
                      CustomButton(
                        type: isRussian ? CustomButtonType.filled : CustomButtonType.bordered,
                        label: 'Русский',
                        onPressed: () {
                          setState(() {
                            isRussian = true;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  CustomButton(
                    isExpanded: false,
                    width: double.infinity,
                    onPressed: () {
                      context.push('/location-access');
                    },
                    label: 'Продолжить',
                  ),
                ],
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
