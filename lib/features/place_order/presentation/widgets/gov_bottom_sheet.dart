import '../../../../core/routes/navigations.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../data/models/governorate.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showGovernorateBottomSheet(
  BuildContext context,
  List<Governorate> governorates,
  Function(Governorate) onSelected,
) {
  showModalBottomSheet(
    backgroundColor: AppColors.backgroundColor,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(16),
          Text('Select Governorate', style: TextStyles.title),
          const Gap(16),
          Expanded(
            child: ListView.separated(
              itemCount: governorates.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 2, color: Colors.grey),
              itemBuilder: (context, index) {
                final governorate = governorates[index];
                return ListTile(
                  title: Text(
                    governorate.governorateNameEn ?? '',
                    style: TextStyles.subtitle1,
                  ),
                  onTap: () {
                    onSelected(governorate);
                    pop(context);
                  },
                );
              },
            ),
          ),
        ],
      );
    },
  );
}
