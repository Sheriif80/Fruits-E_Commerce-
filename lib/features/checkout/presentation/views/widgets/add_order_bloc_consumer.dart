import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';

class AddOrderBlocConsumer extends StatelessWidget {
  const AddOrderBlocConsumer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          EasyLoading.dismiss();
          AppSnackbars.showSuccess(context, message: "تم اضافة الطلب بنجاح");
          Navigator.pop(context);
        }
        if (state is AddOrderError) {
          EasyLoading.dismiss();
          AppSnackbars.showError(context, message: state.message);
        }
        if (state is AddOrderLoading) {
          EasyLoading.show();
        }
      },
      builder: (context, state) {
        return child;
      },
    );
  }
}
