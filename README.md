# iToast
iToast is a Flutter package used to display toast messages in applications. This package is utilized to provide users with temporary notifications, typically used to convey successful operations, errors, warnings, or informative messages.

<img src="assets/itoast.gif" alt="Example Project" style="width: 200px; height: auto;">

## Table of contents

- [iToast](#itoast)
  - [Table of contents](#table-of-contents)
  - [Features](#features)
    - [itoast Message Types](#itoast-message-types)
  - [Installation](#installation)
  - [Import](#import)
  - [Usage](#usage)
  - [License](#license)

## Features

- **Title and subtitle content:** iToast allows including both title and subtitle content in the toast messages.
- **Complementary content with an icon or custom widget:** Users can add icons or custom widgets to enhance the toast messages.
- **Display duration as desired:** iToast provides options to specify the duration for which the toast message is displayed.
- **Customizable background color, border color, and border radius:** Users can customize the background color, border color, and border radius of the toast messages according to their preferences.
- **Custom sizing options:** iToast offers customization options for the width and height of the toast messages.

### itoast Message Types

iToast offers five different types of toast messages:

- **InfoToastMessage:** Used for informative messages.
- **SuccessToastMessage:** Indicates successful operations.
- **WarningToastMessage:** Alerts the user to potential issues.
- **ErrorToastMessage:** Reports error situations.
- **CustomToastMessage:** Utilized to create customized toast messages. Users can specify properties such as background color, border color, border radius, width, and height.

## Installation
```yaml
dependencies:
  itoast: <latest version>
```

## Import
```dart
import 'package:itoast/itoast.dart';
```

## Usage

```dart
 import 'package:flutter/material.dart';
import 'package:itoast/itoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const IToast({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ToastType> toastType = [ToastType.error, ToastType.info, ToastType.success, ToastType.warning];
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
                    toastType[index].name.substring(0, 1).toUpperCase() + toastType[index].name.substring(1),
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
                  borderColor: Colors.blueGrey,
                  leading: const Icon(Icons.explore, color: Colors.teal),
                  borderRadius: BorderRadius.circular(24),
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
  Color? borderColor,
  Widget? leading,
  BorderRadius? borderRadius,
}) {
  iToast(
    context,
    title: Text(title),
    subtitle: Text(subTitle),
    trailing: const Icon(Icons.close_rounded),
    toastType: toastType,
    leading: leading,
    duration: Durations.extralong4,
    toastBackgroundColor: backgroundColor,
    toastBorderColor: borderColor,
    toastBorderRadius: borderRadius,
  );
}


```

## License
 
MIT License

Copyright (c) 2024 iWallet Türkiye

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

