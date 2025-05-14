import 'package:evently/auth/provider/auth_provider.dart';
import 'package:evently/common/app_colors.dart';
import 'package:evently/common/views/categories_slider.dart';
import 'package:evently/common/widgets/custom_text_styles.dart';
import 'package:evently/home/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    UserModel? userModel = context.watch<UserAuthProvider>().userModel;
    CategoryValues? selectedId =
        context.watch<HomeTabProvider>().selectedCategory;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(24))),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back ✨',
                      style: CustomTextStyles.style14w400White
                          .copyWith(color: Theme.of(context).dividerColor),
                    ),
                    Text(
                      userModel?.name ?? '',
                      style: CustomTextStyles.style18w700White.copyWith(
                          fontSize: 24, color: Theme.of(context).dividerColor),
                    ) //TODO:edit
                    ,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).dividerColor,
                        ),
                        Text('Cairo , Egypt',
                            style: CustomTextStyles.style14w500White.copyWith(
                                color: Theme.of(context).dividerColor)),
                      ],
                    ) //TODO:edit
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.read<AppSettingsProvider>().changeAppTheme();
                      },
                      icon: Icon(
                        Icons.wb_sunny_outlined,
                        color: Theme.of(context).dividerColor,
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: FilledButton(
                      style: FilledButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          backgroundColor: Theme.of(context).dividerColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        context.read<AppSettingsProvider>().changeLocale();
                      },
                      child: Text(
                        context
                            .watch<AppSettingsProvider>()
                            .getAppLocalString()
                            .toUpperCase(),
                        style: CustomTextStyles.style14w700Black
                            .copyWith(color: AppColors.mainColor),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CategoriesSlider(
                categoryValues: selectedId,
                onSelect: (p0) {
                  context.read<HomeTabProvider>().editSelectedCategory(p0);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
