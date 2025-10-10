import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_images.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_text.dart';
import 'package:flutter_lakshman1020/features/acounts/presentation/widgets/text_field.dart';

import '../../../../core/constants/app_colors.dart';

class EditPersonalInfo extends StatelessWidget {
  const EditPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameTEController = TextEditingController();
    final TextEditingController _emailTEController = TextEditingController();
    final TextEditingController dateOfBirthTEController =
        TextEditingController();
    final TextEditingController mobileTEController = TextEditingController();
    final TextEditingController addressTEController = TextEditingController();
    final TextEditingController nationalityTEController =
        TextEditingController();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          CustomText(
            'Name',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: TColors.grey,
            ),
          ),
          SizedBox(height: 8),
          CustomTextField(label: 'Name', controller: nameTEController),
          SizedBox(height: 16),

          // Email
          CustomText(
            'Email',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: TColors.grey,
            ),
          ),
          SizedBox(height: 8),
          CustomTextField(label: 'Email', controller: _emailTEController),
          SizedBox(height: 16),

          // Mobile & Date of Birth
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Mobile',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: TColors.grey,
                      ),
                    ),

                    SizedBox(height: 8),

                    CustomTextField(
                      label: 'Mobile',
                      controller: _emailTEController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: TColors.textfieldPrefixIconBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              Images.flag,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Date of birth',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: TColors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      label: 'Date of birth',
                      controller: _emailTEController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: TColors.textfieldPrefixIconBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              Images.calendar,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Address & Nationality
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Address',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: TColors.grey,
                      ),
                    ),

                    SizedBox(height: 8),

                    CustomTextField(
                      label: 'Address',
                      controller: _emailTEController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: TColors.textfieldPrefixIconBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              Images.location,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Nationality',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: TColors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      label: 'Nationality',
                      controller: _emailTEController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
