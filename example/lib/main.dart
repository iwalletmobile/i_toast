import 'package:example/widget_extensions.dart';
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
      title: 'iToast Example',
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
    final Map<ToastType, Color> toastTypes = {
      ToastType.error: ColorConstants.statesError.shade300,
      ToastType.info: ColorConstants.statesInfo.shade300,
      ToastType.success: ColorConstants.statesSuccess.shade300,
      ToastType.warning: ColorConstants.statesWarning.shade300
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("iToast Example"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...toastTypes.entries.map(
                (toast) {
                  return ElevatedButton(
                    onPressed: () {
                      _showToastMessage(
                        context,
                        "${toast.key.name} description.",
                        toast.key,
                        title: toast.key.name.substring(0, 1).toUpperCase() +
                            toast.key.name.substring(1),
                        leading: Icon(
                          Icons.info,
                          color: toast.value,
                        ),
                        trailing: Icon(
                          Icons.close,
                          color: toast.value,
                        ),
                      );
                    },
                    child: Text(
                        '${toast.key.name.toUpperCase()} with leading and trailing'),
                  ).addSize;
                },
              ),
              ...toastTypes.entries.map(
                (toast) {
                  return ElevatedButton(
                    onPressed: () {
                      _showToastMessage(
                        context,
                        "${toast.key.name} description.",
                        toast.key,
                        title: toast.key.name.substring(0, 1).toUpperCase() +
                            toast.key.name.substring(1),
                        trailing: Icon(
                          Icons.close,
                          color: toast.value,
                        ),
                      );
                    },
                    child: Text(
                        '${toast.key.name.toUpperCase()} without trailing'),
                  ).addSize;
                },
              ),
              ...toastTypes.entries.map(
                (toast) {
                  return ElevatedButton(
                    onPressed: () {
                      _showToastMessage(
                        context,
                        "${toast.key.name} description.",
                        toast.key,
                        title: toast.key.name.substring(0, 1).toUpperCase() +
                            toast.key.name.substring(1),
                        leading: Icon(
                          Icons.info,
                          color: toast.value,
                        ),
                      );
                    },
                    child:
                        Text('${toast.key.name.toUpperCase()} without leading'),
                  ).addSize;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _showToastMessage(
                    context,
                    "Custom iToast description.",
                    ToastType.custom,
                    title: 'Custom iToast',
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
              ).addSize,
            ],
          ),
        ),
      ),
    );
  }
}

void _showToastMessage(
  BuildContext context,
  String description,
  ToastType toastType, {
  String? title,
  Color? backgroundColor,
  Border? border,
  Widget? trailing,
  Widget? leading,
  Color? textColor,
  BorderRadius? borderRadius,
}) {
  IToastService.show(
    context,
    title: title,
    description: description,
    trailing: trailing,
    toastType: toastType,
    leading: leading,
    duration: Durations.extralong4,
    toastBackgroundColor: backgroundColor,
    toastBorder: border,
    toastBorderRadius: borderRadius,
    toastTextColor: textColor,
  );
}
