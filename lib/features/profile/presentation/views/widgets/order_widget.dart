import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.orderNumber,
    required this.orderDate,
    required this.totalAmount,
    required this.orderStatus,
  });
  final String orderNumber;
  final String orderDate;
  final double totalAmount;
  final String orderStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("تفاصيل الطلب"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("اغلاق"),
              ),
            ],
            contentPadding: const EdgeInsets.all(20),
            backgroundColor: context.isDarkMode
                ? AppColors.darkContainer
                : Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("رقم الطلب بالكامل : \n $orderNumber"),
                const Gap(10),
                Text("تاريخ الطلب : \n ${orderDate.substring(0, 19)}"),
                const Gap(10),
                Text(
                  "قيمة الطلب : \n $totalAmount"
                  " جنيه",
                ),
                const Gap(10),
                Text("حالة الطلب : \n $orderStatus"),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 107,
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.darkContainer
              : const Color(0x7FF2F3F3),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 33,
              backgroundColor: context.isDarkMode
                  ? AppColors.darkContainer
                  : const Color(0xFFEBF9F1),
              child: SvgPicture.asset(Assets.imagesOrder),
            ),
            const Gap(7),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'طلب رقم:  ${orderNumber.substring(0, 10).toUpperCase()}',
                  style: Appstyles.bold13,
                  overflow: .ellipsis,
                ),
                const Gap(6),
                Text(
                  'تم الطلب : ${orderDate.substring(0, 10)}',
                  style: Appstyles.regular11.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                const Gap(6),
                Text(
                  "الاجمالي : ${totalAmount.toString()} جنيه",
                  style: Appstyles.bold13,
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
