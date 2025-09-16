import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutx_core/flutx_core.dart';
import 'package:get/get.dart';

// import '../../../../core/common/widgets/app_logo.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/form_error_message.dart';
import '../../../../core/theme/app_buttoms.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/input_decoration_extensions.dart';
import '../controller/join_league_controller.dart';

class JoinLeagueScreen extends StatelessWidget {
  JoinLeagueScreen({super.key});

  final JoinLeagueController controller = Get.put(JoinLeagueController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Center(
                      child: 'Join league'.text20w700(color: AppColors.white),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child:
                          'Build your team and join the league—add players, set\ndetails, and get ready to compete!'
                              .text14w400(color: AppColors.gray),
                    ),
                    const SizedBox(height: 20),

                    /// Error message from controller
                    Obx(
                      () => FormErrorMessage(
                        message: controller.errorMessage.value,
                      ),
                    ),

                    const SizedBox(height: 8),

                    _LabeledField(
                      hint: 'Team Name',
                      controller: controller.teamNameController,
                      validator: Validators.required,
                    ),
                    _LabeledField(
                      hint: 'Captain Name',
                      controller: controller.captainNameController,
                      validator: Validators.required,
                    ),
                    _LabeledField(
                      hint: 'Partner Name',
                      controller: controller.partnerNameController,
                    ),
                    _PlayerLevelDropdown(controller: controller),
                    _LabeledField(
                      hint: 'Email',
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                    ),
                    _LabeledField(
                      hint: 'Contact Number',
                      controller: controller.contactNumberController,
                      keyboardType: TextInputType.phone,
                      validator: Validators.required,
                    ),

                    const SizedBox(height: 8),
                    'Upload your logo/photo'.text14w500(color: AppColors.white),
                    const SizedBox(height: 8),
                    _UploadBox(controller: controller),

                    const SizedBox(height: 16),
                    _LeagueDropdown(controller: controller),

                    const SizedBox(height: 16),
                    _CheckRow(
                      valueListenable: controller.agreedRules,
                      label: 'I agree to the League Rules & Code of Conduct',
                      onChanged: (v) =>
                          controller.agreedRules.value = v ?? false,
                    ),
                    const SizedBox(height: 12),
                    _CheckRow(
                      valueListenable: controller.confirmedAvailability,
                      label:
                          'I confirm my availability for all scheduled matches.',
                      onChanged: (v) =>
                          controller.confirmedAvailability.value = v ?? false,
                    ),

                    const SizedBox(height: 24),
                    Obx(
                      () => PrimaryButton(
                        isLoading: controller.isLoading.value,
                        onPressed: controller.submitApplication,
                        text: 'Apply to League',
                        backgroundColor: AppColors.white,
                        textColor: AppColors.buttonText,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _LabeledField({
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: AppColors.primaryText, fontSize: 16),
        decoration: context.primaryInputDecoration.copyWith(hintText: hint),
        validator: validator,
      ),
    );
  }
}

class _UploadBox extends StatelessWidget {
  final JoinLeagueController? controller;
  _UploadBox({this.controller});
  @override
  Widget build(BuildContext context) {
    final ctrl = controller ?? Get.find<JoinLeagueController>();
    return Obx(() {
      final hasImage = ctrl.selectedLogo.value != null;
      return InkWell(
        onTap: ctrl.pickLogo,
        child: Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            color: AppColors.textFieldBackground,
            border: Border.all(color: AppColors.textFieldBorder),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: hasImage
                ? Image.file(
                    File(ctrl.selectedLogo.value!.path),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.image_outlined, color: AppColors.gray),
                      const SizedBox(height: 8),
                      'Drop your files here'.text14w400(color: AppColors.gray),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: 'Choose File'.text12w600(
                          color: AppColors.buttonText,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}

class _LeagueDropdown extends StatelessWidget {
  final JoinLeagueController controller;
  const _LeagueDropdown({required this.controller});

  @override
  Widget build(BuildContext context) {
    final leagues = <String>['Premier', 'Challenger', 'Amateur'];
    return Obx(
      () => DropdownButtonFormField<String>(
        value: controller.selectedLeague.value.isEmpty
            ? null
            : controller.selectedLeague.value,
        items: leagues
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e, style: const TextStyle(color: AppColors.white)),
              ),
            )
            .toList(),
        onChanged: (v) => controller.selectedLeague.value = v ?? '',
        decoration: context.primaryInputDecoration.copyWith(
          hintText: 'Select League',
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textFieldTextiHint,
          ),
        ),
        dropdownColor: AppColors.textFieldBackground,
        style: const TextStyle(color: AppColors.white),
      ),
    );
  }
}

class _CheckRow extends StatelessWidget {
  final RxBool valueListenable;
  final String label;
  final ValueChanged<bool?> onChanged;

  const _CheckRow({
    required this.valueListenable,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: valueListenable.value,
            onChanged: onChanged,
            activeColor: AppColors.primaryGreen,
            checkColor: AppColors.buttonText,
            side: const BorderSide(color: AppColors.textFieldBorder),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          const SizedBox(width: 6),
          Expanded(child: label.text14w400(color: AppColors.white)),
        ],
      ),
    );
  }
}

class _PlayerLevelDropdown extends StatelessWidget {
  final JoinLeagueController controller;
  const _PlayerLevelDropdown({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<int>(
        value: controller.selectedPlayerLevelId.value,
        items: controller.playerLevels.map((level) {
          final int id = level['id'] as int;
          final String label = level['label'] as String;
          final String? asset = level['asset'] as String?;
          return DropdownMenuItem<int>(
            value: id,
            child: Row(
              children: [
                if (asset != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.asset(asset, width: 20, height: 20),
                  )
                else
                  const SizedBox.shrink(),
                Text(label, style: const TextStyle(color: AppColors.white)),
              ],
            ),
          );
        }).toList(),
        onChanged: (v) => controller.selectedPlayerLevelId.value = v,
        decoration: context.primaryInputDecoration.copyWith(
          hintText: 'Player Levels',
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textFieldTextiHint,
          ),
        ),
        dropdownColor: AppColors.textFieldBackground,
        style: const TextStyle(color: AppColors.white),
        validator: (v) => v == null ? 'Please select player level' : null,
      ),
    );
  }
}
