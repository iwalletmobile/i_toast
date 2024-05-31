import 'package:flutter/material.dart';
import 'package:i_toast/i_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IToast(),
    );
  }
}

class IToast extends StatelessWidget {
  const IToast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ToastType> toastType = [
      ToastType.error,
      ToastType.info,
      ToastType.success,
      ToastType.warning
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("iToast Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: toastType.length,
              padding: const EdgeInsets.symmetric(horizontal: 120),
              itemBuilder: (context, index) => ElevatedButton(
                onPressed: () {
                  _showToastMessage(
                    context,
                    toastType[index].name.substring(0, 1).toUpperCase() +
                        toastType[index].name.substring(1),
                    "${toastType[index].name} subtitle.",
                    toastType[index],
                    leading: const Icon(Icons.info),
                  );
                },
                child: const Text("Show iToast"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showToastMessage(
                  context,
                  'Custom iToast',
                  "Custom iToast subtitle.",
                  ToastType.custom,
                  backgroundColor: Colors.blueGrey.shade50,
                  border: Border.all(
                    color: Colors.blueGrey,
                  ),
                  leading: const Icon(Icons.explore, color: Colors.teal),
                  borderRadius: BorderRadius.circular(24),
                  textColor: Colors.black,
                );
              },
              child: const Text('Show Custom iToast'),
            ),
          ],
        ),
      ),
    );
  }
}

void _showToastMessage(
  BuildContext context,
  String title,
  String subTitle,
  ToastType toastType, {
  Color? backgroundColor,
  Border? border,
  Widget? leading,
  Color? textColor,
  BorderRadius? borderRadius,
}) {
  IToastService.show(
    context,
    title: title,
    subtitle: subTitle,
    trailing: const Icon(Icons.close_rounded),
    toastType: toastType,
    leading: leading,
    duration: Durations.extralong4,
    toastBackgroundColor: backgroundColor,
    toastBorder: border,
    toastBorderRadius: borderRadius,
    toastTextColor: textColor,
  );
}
