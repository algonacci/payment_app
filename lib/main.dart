import 'package:flutter/material.dart'
import 'package:payment_app/theme.dart';

void main() {
  runApp(PaymentApp());
}

class PaymentApp extends StatefulWidget {
  @override
  _PaymentAppState createState() => _PaymentAppState();
}

class _PaymentAppState extends State<PaymentApp> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(
            top: 14,
            left: 32,
            right: 32,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xff007DFF)
                  : Color(0xff4D5B7C),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/radio_button_active.png',
                          width: 18,
                        )
                      : Image.asset(
                          'assets/radio_button_inactive.png',
                          width: 18,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: primaryTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 91,
                  ),
                  Text(
                    pricing,
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 32,
          right: 32,
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/image_goal.png',
                width: 250,
                height: 200,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to ',
                  style: primaryTextStyle.copyWith(
                    fontSize: 26,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  'Pro',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 26,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Go unlock all features and \nbuild your own business bigger',
              style: subTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 52,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: secondaryTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(71),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Checkout Now',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                )),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              option(
                0,
                'Monthly',
                'Good for starting up',
                '\$20',
              ),
              option(
                1,
                'Quarterly',
                'Focusing on building',
                '\$55',
              ),
              option(
                2,
                'Yearly',
                'Steady Company',
                '\$220',
              ),
              SizedBox(
                height: 17,
              ),
              selectedIndex == -1 ? SizedBox() : checkoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
