import 'package:evently/common/app_colors.dart';
import 'package:evently/common/widgets/custom_text_styles.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesSlider extends StatelessWidget {
  const CategoriesSlider(
      {super.key,
      required this.categoryValues,
      required this.onSelect,
      this.invertColors = false});
  final CategoryValues? categoryValues;
  final bool invertColors;
  final void Function(CategoryValues) onSelect;

  @override
  Widget build(BuildContext context) {
    Provider.of<AppSettingsProvider>(context);
    return SizedBox(
        height: 50,
        child: ListView.separated(
          itemCount: CategoryModel.categories.length,
          padding: const EdgeInsets.all(4),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            CategoryModel currantCatModel = CategoryModel.categories[index];
            return GestureDetector(
              onTap: () {
                onSelect(currantCatModel.categoryValues);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: currantCatModel.categoryValues == categoryValues
                        ? Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? AppColors.mainColor
                            : invertColors
                                ? AppColors.mainColor
                                : Theme.of(context).dividerColor
                        : null,
                    border: Border.all(
                        color: context.watch<AppSettingsProvider>().themeMode ==
                                ThemeMode.dark
                            ? AppColors.mainColor
                            : invertColors
                                ? AppColors.mainColor
                                : AppColors.lightTextColor),
                    borderRadius: BorderRadius.circular(46)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      currantCatModel.iconData,
                      color: currantCatModel.categoryValues == categoryValues
                          ? Theme.of(context).colorScheme.brightness ==
                                  Brightness.dark
                              ? AppColors.lightTextColor
                              : invertColors
                                  ? AppColors.lightTextColor
                                  : AppColors.mainColor
                          : invertColors
                              ? AppColors.mainColor
                              : Theme.of(context).dividerColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      currantCatModel.title,
                      style: CustomTextStyles.style14w700White.copyWith(
                          color:
                              currantCatModel.categoryValues == categoryValues
                                  ? Theme.of(context).colorScheme.brightness ==
                                          Brightness.dark
                                      ? AppColors.lightTextColor
                                      : invertColors
                                          ? AppColors.lightTextColor
                                          : AppColors.mainColor
                                  : invertColors
                                      ? AppColors.mainColor
                                      : Theme.of(context).dividerColor),
                    )
                  ],
                ),
              ),
            );
          },
          // ChoiceChip(
          //     selectedColor: Theme.of(context).dividerColor,
          //     showCheckmark: false,
          //     labelStyle: CustomTextStyles.style16w700White
          //         .copyWith(color: Theme.of(context).hoverColor),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(46)),
          //     side: BorderSide(color: Theme.of(context).dividerColor, width: 2),
          //     color: WidgetStatePropertyAll(index == 0
          //         ? Theme.of(context).dividerColor
          //         : Theme.of(context).highlightColor),
          //     label: Row(
          //       children: [
          //         Icon(
          //           Icons.cake_outlined,
          //           color: index == 0
          //               ? Theme.of(context).highlightColor
          //               : Theme.of(context).dividerColor,
          //         ),
          //         Text(
          //           'xxx',
          //           style: CustomTextStyles.style16w700White.copyWith(
          //               color: index == 0
          //                   ? Theme.of(context).highlightColor
          //                   : Theme.of(context).dividerColor),
          //         )
          //       ],
          //     ),
          //     selected: index == 0),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 10,
          ),
        ));
  }
}
