import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/data/dataSource/local/user_type_data.dart';

class EmployeeTypeCard extends StatelessWidget {
  final Function() action;
  final UserTypeModel userType;
  final bool isSelected;

  const EmployeeTypeCard(
      {super.key,
      required this.action,
      required this.userType,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: action,
        child: Container(
          height: AppRatioSize.getRatioHeight() / 6,
          margin: const EdgeInsets.only(
            bottom: 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: AppRatioSize.getRatioHeight() / 88),
                decoration: BoxDecoration(
                    color: isSelected
                        ? AppColor.primary.withOpacity(0.1)
                        : Theme.of(context).brightness == Brightness.light
                            ? AppColor.textBlueGrey.withOpacity(0.05)
                            : AppColor.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: isSelected
                            ? AppColor.primary
                            : Theme.of(context).brightness == Brightness.light
                                ? AppColor.textBlueGrey.withOpacity(0.1)
                                : AppColor.lightBlueGrey,
                        width: isSelected ? 2 : 0.5)),
              ),
              isSelected
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(0, 16, 8, 0),
                      alignment: Alignment.topRight,
                      child: Container(
                          width: AppRatioSize.getRatioWidth() / 24,
                          height: AppRatioSize.getRatioWidth() / 24,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: AppRatioSize.getRatioWidth() / 24,
                            color: AppColor.white,
                          )),
                    )
                  : Container(
                      margin: const EdgeInsets.fromLTRB(0, 16, 8, 0),
                      alignment: Alignment.topRight,
                      child: Container(
                        width: AppRatioSize.getRatioWidth() / 24,
                        height: AppRatioSize.getRatioWidth() / 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.lightBlueGrey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
              _employeeData(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _employeeData(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: AppRatioSize.getRatioHeight() / 16,
          child: Image.asset(userType.iconPath,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.textBlueGrey
                  : AppColor.lightBlueGrey),
        ),
        AppRatioSpaces.verticalSectionSpaceXXXS(),
        Text(
          userType.title.tr,
          maxLines: 1,
          style: TextStyleX.subHeading2BlueGrey(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
