import 'package:BrainScopeAI/features/home/presentation/controller/new_scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/new_scan/widgets/new_scan_body.dart';
import 'package:get/get.dart';

class NewScanScreen extends StatelessWidget {
  const NewScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ScannerController>();

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Scan'),
          leading: IconButton(
              onPressed: () {
                controller.deleteChanges();
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          actions: [
            Obx(
              () {
                if (controller.showResult.value) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                'Add title',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              content: TextField(
                                autofocus: true,
                                onChanged: (value) {
                                  controller.title.value = value;
                                },
                                decoration: InputDecoration(
                                  label: Text('title'),
                                ),
                              ),
                              actions: [
                                IconButton(
                                    onPressed: () async {
                                      if (controller.title.value.isNotEmpty) {
                                        await controller.saveRsult();
                                      }
                                    },
                                    icon: Text(
                                      'save',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ))
                              ],
                            ),
                          );
                        },
                        icon: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Theme.of(context).primaryColor),
                        )),
                  );
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
        body: NewScanBody(),
      ),
    );
  }
}
