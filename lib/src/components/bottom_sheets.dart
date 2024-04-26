import 'package:flutter/material.dart';

class AppBottomSheet {
  static baseSheet({
    required BuildContext context,
    required Widget child,
    double? height,
    EdgeInsets? padding,
    bool? isDismissible,
    bool? enableDrag,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      builder: (context) {
        return PopScope(
          canPop: isDismissible ?? true,
          child: Container(
            padding: padding,
            height: height ?? 300,
            width: MediaQuery.of(context).size.width,
            child: child,
          ),
        );
      },
    );
  }

  static loadingSheet(BuildContext context, {String? loadingText, bool? isDismissible}) {
    return baseSheet(
      context: context,
      isDismissible: isDismissible,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          Text(loadingText ?? "Loading ..."),
        ],
      ),
    );
  }

  static errorSheet(BuildContext context, {String? errorText}) {
    return baseSheet(
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: Icon(Icons.close, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 20),
          Text(errorText ?? "There was an error performing your payment"),
        ],
      ),
    );
  }

  static successSheet(BuildContext context, {String? successText}) {
    return baseSheet(
      context: context,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green,
            child: Icon(Icons.check, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 20),
          Text(successText ?? "Your payment was successful!"),
        ],
      ),
    );
  }
}
