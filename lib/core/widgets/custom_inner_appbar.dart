import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sketchtrace/core/widgets/color_constant.dart';

class CustomInnerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onBackPressed;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final PreferredSizeWidget? bottom;
  final bool showBottomBorder;

  const CustomInnerAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.onBackPressed,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.showBackButton = true,
    this.backgroundColor,
    this.foregroundColor,
    this.bottom,
    this.showBottomBorder = false,
  });

  static double get barHeight => 88.h;

  void _handleBack(BuildContext context) {
    final router = GoRouter.maybeOf(context);
    if (router != null && router.canPop()) {
      router.pop();
    } else if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBgColor = backgroundColor ?? ColorConstant.primaryColor;
    final effectiveFgColor = foregroundColor ?? ColorConstant.white;

    Widget? leadingWidget;
    if (leading != null) {
      leadingWidget = leading;
    } else if (showBackButton) {
      leadingWidget = Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Center(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: ColorConstant.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorConstant.borderColor.withValues(alpha: 0.7),
                width: 1.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.black.withValues(alpha: 0.08),
                  blurRadius: 10.r,
                  spreadRadius: 0,
                  offset: Offset(0, 3.h),
                ),
                BoxShadow(
                  color: ColorConstant.black.withValues(alpha: 0.04),
                  blurRadius: 4.r,
                  spreadRadius: 0,
                  offset: Offset(0, 1.h),
                ),
              ],
            ),
            child: Material(
              color: ColorConstant.transparent,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onBackPressed ?? () => _handleBack(context),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20.sp,
                    color: ColorConstant.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: effectiveBgColor,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black.withValues(alpha: 0.06),
            blurRadius: 20.r,
            spreadRadius: 0,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: AppBar(
        iconTheme: IconThemeData(color: effectiveFgColor),
        actionsIconTheme: IconThemeData(color: effectiveFgColor),
        title:
            titleWidget ??
            (title != null
                ? Text(
                    title!,
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w800,
                      color: effectiveFgColor,
                      letterSpacing: -0.3.sp,
                    ),
                  )
                : null),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: centerTitle,
        automaticallyImplyLeading: leadingWidget != null,
        leading: leadingWidget,
        leadingWidth: leadingWidget != null ? 56.w : null,
        actions: actions,
        bottom: (bottom != null || showBottomBorder)
            ? _AppBarBottom(bottom: bottom, showBottomBorder: showBottomBorder)
            : null,
      ),
    );
  }

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    final extraBorder = showBottomBorder ? 1.0 : 0.0;
    return Size.fromHeight(kToolbarHeight + bottomHeight + extraBorder);
  }
}

class _AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final bool showBottomBorder;

  const _AppBarBottom({this.bottom, required this.showBottomBorder});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (bottom != null) bottom!,
        if (showBottomBorder)
          Divider(height: 1, thickness: 1, color: ColorConstant.borderColor),
      ],
    );
  }

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    final extraBorder = showBottomBorder ? 1.0 : 0.0;
    return Size.fromHeight(bottomHeight + extraBorder);
  }
}
