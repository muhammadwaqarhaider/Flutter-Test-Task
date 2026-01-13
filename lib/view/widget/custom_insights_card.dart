import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:test_task/model/utils/dimensions.dart';
import 'package:test_task/model/utils/images.dart';
import 'package:test_task/model/utils/styles.dart';
import 'package:test_task/view/widget/custom_card.dart';

class CustomInsightsCard extends StatelessWidget {
  final String title, subTitle, text;
  final bool image;

  const CustomInsightsCard({
    super.key,
    required this.title,
    this.image = false,
    required this.subTitle,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: MediaQuery.sizeOf(context).width / 2 - 20,
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: AppStyles.extraBold.copyWith(
                      fontSize: Dimensions.fontSizeOverLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0, left: 3),
                    child: Text(
                      text,
                      style: AppStyles.extraBold.copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (image) ...[
                    SvgPicture.asset(Images.arrowUp),
                    SizedBox(width: 5),
                  ],
                  Text(
                    subTitle,
                    style: AppStyles.regular.copyWith(color: Color(0XFFA4A4A4)),
                  ),
                ],
              ),
              Spacer(),
              if (!image) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0",
                      style: AppStyles.regular.copyWith(
                        color: Color(0XFFA4A4A4),
                      ),
                    ),
                    Text(
                      "2500",
                      style: AppStyles.regular.copyWith(
                        color: Color(0XFFA4A4A4),
                      ),
                    ),
                  ],
                ),
                LinearPercentIndicator(
                  lineHeight: 8,
                  percent: 1200 / 2500,
                  backgroundColor: Colors.grey.shade800,
                  linearGradient: const LinearGradient(
                    colors: [
                      Color(0XFF7BBDE2),
                      Color(0XFF7BBDE2),
                      Color(0XFF60C198),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  barRadius: Radius.circular(10),
                ),
              ] else
                Text("Weight", style: AppStyles.extraBold),
            ],
          ),
        ),
      ),
    );
  }
}
