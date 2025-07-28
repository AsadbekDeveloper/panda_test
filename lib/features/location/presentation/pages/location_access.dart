import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:panda_test/shared/widgets/custom_button.dart';

class LocationAccessPage extends StatelessWidget {
  const LocationAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 34),
              Image.asset('assets/icons/location.png'),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Разрешите доступ к геопозиции',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Так мы сможем показать интересные предложения и пункты выдачи-приёма рядом с вами',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 36),
              Column(
                children: [
                  CustomButton(
                    isExpanded: false,
                    width: double.infinity,
                    onPressed: () {},
                    label: 'Разрешить доступ',
                  ),
                  SizedBox(height: 16),

                  CustomButton(
                    isExpanded: false,
                    width: double.infinity,
                    onPressed: () {
                      context.go('/home');
                    },
                    type: CustomButtonType.bordered,
                    label: 'Указать местоположение',
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
