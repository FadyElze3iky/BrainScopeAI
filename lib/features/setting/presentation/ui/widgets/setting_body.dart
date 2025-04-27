import 'package:BrainScopeAI/features/setting/presentation/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController =
        Get.find<SettingsController>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display current theme

            // Description
            Text(
              'toggle_theme_description'.tr,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            // Theme toggle switch
            Obx(() => SwitchListTile(
                  title: Text(
                    'dark_mode'.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  value: settingsController.isDarkMode.value,
                  onChanged: (value) {
                    settingsController.toggleTheme();
                  },
                  activeColor: Theme.of(context).primaryColor,
                )),
            SizedBox(height: 40),
            // Language toggle
            Obx(() => ListTile(
                  title: Text(
                    'language'.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  trailing: DropdownButton<String>(
                    value: settingsController.currentLocale.value,
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('english'.tr,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text('arabic'.tr,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        settingsController.changeLocale(value);
                      }
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
