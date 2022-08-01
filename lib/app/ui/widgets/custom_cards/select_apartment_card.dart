import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';

class SelectApartmentCard extends StatelessWidget {
  final String? apartmentName;
  final String? apartmentAddress;
  final Function()? onPressed;
  const SelectApartmentCard({
    Key? key,
    this.apartmentName,
    this.apartmentAddress,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        dense: true,
        title: Text(
          apartmentName ?? 'APARTMAN ADI',
          style: AppTextStyle().getSfProDisplayBold_h6(AppColors.ORANGE),
        ),
        subtitle: Text(
          apartmentAddress ?? 'Sokakadı/ilçeadı',
          style: AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_forward_outlined,
            color: AppColors.BLACK,
          ),
        ),
      ),
    );
  }
}
