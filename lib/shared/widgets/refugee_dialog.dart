import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class RefugeeDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? positiveBtnTitle;
  final VoidCallback? positiveBtnCallback;
  final String? negativeBtnTitle;
  final VoidCallback? negativeBtnCallback;
  final String? singleBtnTitle;
  final VoidCallback? singleBtnCallback;

  const RefugeeDialog({
    Key? key,
    required this.title,
    required this.message,
    this.positiveBtnTitle,
    this.positiveBtnCallback,
    this.negativeBtnTitle,
    this.negativeBtnCallback,
    this.singleBtnTitle,
    this.singleBtnCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(message),
            const SizedBox(height: 20.0),
            if (singleBtnTitle != null)
              SizedBox(
                width: double.infinity, // Make the button take the full width
                child: TextButton(
                  onPressed: singleBtnCallback ??
                      () {
                        context.pop();
                      },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent),
                  child: Text(singleBtnTitle!,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.primary)),
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (negativeBtnTitle != null)
                    Expanded(
                        child: TextButton(
                      onPressed: negativeBtnCallback ??
                          () {
                            context.pop();
                          },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          elevation: 0,
                          shadowColor: Colors.transparent),
                      child: Text(negativeBtnTitle ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.primary)),
                    )),
                  const VerticalDivider(
                    color: Colors.black, // Color of the divider
                    thickness: 1, // Thickness of the divider
                    width: 10,
                    // Space around the divider
                    indent: 8, // Top padding of the divider
                    endIndent: 8, // Bottom padding of the divider
                  ),
                  if (positiveBtnTitle != null)
                    Expanded(
                        child: TextButton(
                      onPressed: positiveBtnCallback ??
                          () {
                            context.pop();
                          },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                          elevation: 0,
                          shadowColor: Colors.transparent),
                      child: Text(positiveBtnTitle ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.primary)),
                    ))
                ],
              ),
          ],
        ),
      ),
    );
  }
}
