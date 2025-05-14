import 'package:evently/common/app_colors.dart';
import 'package:evently/common/services/firebase_serices.dart';
import 'package:evently/common/widgets/custom_text_styles.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.eventDataModel});
  final EventDataModel eventDataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              eventDataModel.categoryValues.getDesign(
                  isDark: context.watch<AppSettingsProvider>().themeMode ==
                      ThemeMode.dark),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                DateFormat('dd\nMMM').format(eventDataModel.dateTime),
                style: CustomTextStyles.style14w700Black
                    .copyWith(color: AppColors.mainColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: Text(
                      eventDataModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  FavButton(eventDataModel: eventDataModel)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({
    super.key,
    required this.eventDataModel,
  });

  final EventDataModel eventDataModel;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  late bool favValue = widget.eventDataModel.isFav;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        favValue = !favValue;

        FirebaseSerices.changeEventFav(widget.eventDataModel, favValue);
      },
      child: Icon(
        favValue ? Icons.favorite : Icons.favorite_border,
        color: AppColors.mainColor,
      ),
    );
  }
}
