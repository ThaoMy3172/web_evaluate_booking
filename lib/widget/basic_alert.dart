import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../config/theme_config.dart';
import '../utils/navigation_service.dart';

class BasicAlert {
  static successToast({
    BuildContext? context,
    required String content,
  }) =>
      CherryToast.success(
        title: Text(
          'Thông báo',
          style: ThemeConfig.titleStyle,
        ),
        description: Text(content),
        animationType: AnimationType.fromTop,
        animationDuration: const Duration(milliseconds: 500),
        toastDuration: const Duration(seconds: 2),
        toastPosition: Position.top,
      ).show(context ?? NavigationService.navigatorKey.currentContext!);

  static errorToast({
    BuildContext? context,
    required String content,
  }) =>
      CherryToast.error(
        title: Text(
          'Thông báo',
          style: ThemeConfig.titleStyle,
        ),
        description: Text(content),
        animationType: AnimationType.fromTop,
        animationDuration: const Duration(milliseconds: 500),
        toastDuration: const Duration(seconds: 2),
        toastPosition: Position.top,
      ).show(context ?? NavigationService.navigatorKey.currentContext!);

  static successAlert(
    BuildContext context, {
    required String title,
    String? confirmBtnText,
    double? width,
    Widget? widget,
    bool? showCancelBtn,
    void Function()? onConfirmBtnTap,
    void Function()? onCancelBtnTap,
  }) =>
      QuickAlert.show(
          title: title,
          width: width ?? 500,
          confirmBtnText: confirmBtnText ?? 'Xác nhận',
          widget: widget,
          onConfirmBtnTap: onConfirmBtnTap,
          onCancelBtnTap: onCancelBtnTap,
          context: context,
          showCancelBtn: showCancelBtn ?? false,
          type: QuickAlertType.success,
          customAsset: 'assets/gif/success.gif',
          cancelBtnText: "Hủy");

  static warningAlert(
    BuildContext context, {
    required String title,
    String? confirmBtnText,
    double? width,
    bool? showCancelBtn,
    Widget? widget,
    void Function()? onConfirmBtnTap,
    void Function()? onCancelBtnTap,
  }) =>
      QuickAlert.show(
          title: title,
          showCancelBtn: showCancelBtn ?? false,
          width: width ?? 500,
          confirmBtnText: confirmBtnText ?? 'Xác nhận',
          widget: widget,
          context: context,
          onConfirmBtnTap: onConfirmBtnTap,
          onCancelBtnTap: onCancelBtnTap,
          type: QuickAlertType.warning,
          customAsset: 'assets/gif/warning.gif',
          cancelBtnText: "Hủy");

  static errorAlert(
    BuildContext context, {
    required String title,
    String? confirmBtnText,
    double? width,
    Widget? widget,
    bool? showCancelBtn,
    void Function()? onConfirmBtnTap,
    void Function()? onCancelBtnTap,
  }) =>
      QuickAlert.show(
        width: width ?? 500,
        title: title,
        confirmBtnText: confirmBtnText ?? 'Xác nhận',
        onConfirmBtnTap: onConfirmBtnTap,
        onCancelBtnTap: onCancelBtnTap,
        widget: widget,
        showCancelBtn: showCancelBtn ?? false,
        context: context,
        type: QuickAlertType.error,
        customAsset: 'assets/gif/error.gif',
      );
}
