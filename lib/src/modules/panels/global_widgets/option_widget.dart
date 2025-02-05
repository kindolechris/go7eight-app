
import 'package:flutter/cupertino.dart';

import '../../../core/app_export.dart';
import '../../../models/setting_option_model.dart';

class OptionWidget extends StatefulWidget {
  final String title;
  final List<OptionModel> filterOptions;
  final bool showLeftPadding;

  const OptionWidget(
      {super.key,
      required this.title,
      required this.filterOptions,
      this.showLeftPadding = true});

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != ""
            ? AppSectionTitle(
                title: widget.title,
              )
            : Container(),
        SizedBox(
            height: AppRatioSize.getRatioHeight() / 22,
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: widget.filterOptions.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        for (int i = 0; i < widget.filterOptions.length; i++) {
                          if (widget.filterOptions[index] ==
                              widget.filterOptions[i]) {
                            widget.filterOptions[i].isSelected =
                                !widget.filterOptions[i].isSelected;
                          } else {
                            widget.filterOptions[i].isSelected = false;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppRatioSize.getRatioWidth() / 36),
                      margin: EdgeInsets.only(
                          left: index == 0 && widget.showLeftPadding
                              ? AppRatioSize.getRatioWidth() / 24
                              : 0,
                          right: index != (widget.filterOptions.length - 1)
                              ? AppRatioSize.getRatioWidth() / 44
                              : AppRatioSize.getRatioWidth() / 24),
                      decoration: BoxDecoration(
                        color: widget.filterOptions[index].isSelected
                            ? Theme.of(context).brightness == Brightness.light
                                ? AppColor.textBlueGrey
                                : AppColor.primary
                            : Theme.of(context).brightness == Brightness.light
                                ? AppColor.white
                                : AppColor.black,
                        border: Border.all(
                          color: widget.filterOptions[index].isSelected
                              ? Theme.of(context).brightness == Brightness.light
                                  ? AppColor.textBlueGrey
                                  : AppColor.primary
                              : Theme.of(context).brightness == Brightness.light
                                  ? AppColor.lightBlueGrey.withOpacity(0.2)
                                  : AppColor.lightBlueGrey.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            widget.filterOptions[index].text.tr,
                            textAlign: TextAlign.start,
                            style: TextStyleX.subHeading2(context).copyWith(
                              color: widget.filterOptions[index].isSelected
                                  ? AppColor.white
                                  : Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColor.textBlueGrey
                                      : AppColor.creamColor,
                              fontSize: AppTextSizes.drawerSelected(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
