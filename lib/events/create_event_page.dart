import 'package:evently/common/app_colors.dart';
import 'package:evently/common/services/firebase_serices.dart';
import 'package:evently/common/views/categories_slider.dart';
import 'package:evently/common/widgets/custom_main_button.dart';
import 'package:evently/common/widgets/custom_text_styles.dart';
import 'package:evently/events/widgets/custom_text_field.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_data_model.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreateEventPage extends StatefulWidget {
  static const String routeName = '/createEventPage';
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  CategoryValues selectedCategory = CategoryValues.all;
  TextEditingController titleController = TextEditingController();
  TextEditingController descreptioController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String states = '', error = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    selectedCategory.getDesign(
                        isDark:
                            context.watch<AppSettingsProvider>().themeMode ==
                                ThemeMode.dark),
                    height: size.height * .25,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 16,
              ),
              CategoriesSlider(
                invertColors: true,
                categoryValues: selectedCategory,
                onSelect: (p0) {
                  selectedCategory = p0;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                title: 'Title',
                controller: titleController,
                hintText: 'Event Title',
                prefix: Icon(
                  Icons.mode_edit_rounded,
                  color: Theme.of(context).hoverColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                title: 'Description',
                controller: descreptioController,
                hintText: 'Event Description',
                maxLines: 3,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Theme.of(context).textTheme.labelMedium!.color,
                  ),
                  Text(
                    'Event Date',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        _selectDate();
                      },
                      child: Text(
                        selectedDate == null
                            ? 'Choose Date'
                            : DateFormat('yyyy/MM/dd').format(selectedDate!),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.mainColor),
                      ))
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Theme.of(context).textTheme.labelMedium!.color,
                  ),
                  Text(
                    'Event Time',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        _selectTime();
                      },
                      child: Text(
                        selectedTime == null
                            ? 'Choose Time'
                            : '${selectedTime!.hour}:${selectedTime!.minute} ${selectedTime!.period.name}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.mainColor),
                      ))
                ],
              ),
              states == 'loading'
                  ? const Center(
                      child: const CircularProgressIndicator(),
                    )
                  : states == 'error'
                      ? Text(error)
                      : CustomMainButton(
                          title: 'Add Event',
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                selectedDate != null &&
                                selectedTime != null) {
                              setState(() {
                                states = 'loading';
                              });
                              try {
                                selectedDate!.copyWith(
                                    hour: selectedTime!.hour,
                                    minute: selectedTime!.minute);

                                EventDataModel eventDataModel = EventDataModel(
                                    title: titleController.text.trim(),
                                    description:
                                        descreptioController.text.trim(),
                                    categoryValues: selectedCategory,
                                    dateTime: selectedDate!);

                                FirebaseSerices.addNewEvent(eventDataModel);
                                setState(() {
                                  states = 'success';

                                  selectedDate = null;
                                  selectedTime = null;
                                  titleController.clear();
                                  descreptioController.clear();
                                  selectedCategory = CategoryValues.all;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    'event was added successfuly',
                                    style: CustomTextStyles.style18w500White,
                                  ),
                                  backgroundColor: Colors.green,
                                ));
                              } catch (e) {
                                setState(() {
                                  error = e.toString();
                                  states = 'error';
                                });
                              }
                            } else if (selectedDate == null ||
                                selectedTime == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  'the date or time is missing',
                                  style: CustomTextStyles.style18w500White,
                                ),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                        )
            ],
          ),
        ),
      ),
    );
  }

  _selectTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      selectedTime = pickedTime;
      setState(() {});
    }
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
