import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../../core/base/base_controller.dart';
import '../../../../core/utils/debug_print.dart';

class JoinLeagueController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController captainNameController = TextEditingController();
  final TextEditingController partnerNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  final RxString selectedLeague = ''.obs;
  final RxnInt selectedPlayerLevelId = RxnInt();
  final RxBool agreedRules = false.obs;
  final RxBool confirmedAvailability = false.obs;
  final Rxn<XFile> selectedLogo = Rxn<XFile>();

  /// Static player level options that map to API ints
  /// 1: Beginner, 2: Intermediate, 3: Intermediate high, 4: Advance, 5: Pro
  final List<Map<String, Object?>> playerLevels = const [
    {'id': 1, 'label': 'Beginner', 'asset': null},
    {'id': 2, 'label': 'Intermediate', 'asset': null},
    {'id': 3, 'label': 'Intermediate high', 'asset': null},
    {'id': 4, 'label': 'Advance', 'asset': null},
    {'id': 5, 'label': 'Pro', 'asset': null},
  ];

  @override
  void onClose() {
    teamNameController.dispose();
    captainNameController.dispose();
    partnerNameController.dispose();
    emailController.dispose();
    contactNumberController.dispose();
    super.onClose();
  }

  Future<void> pickLogo() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? file = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (file != null) {
        selectedLogo.value = file;
        clearError();
      }
    } catch (e) {
      setError('Failed to pick image');
    }
  }

  Future<void> submitApplication() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    if (selectedLeague.value.isEmpty) {
      setError('Please select a league');
      return;
    }
    if (selectedPlayerLevelId.value == null) {
      setError('Please select a player level');
      return;
    }
    if (!agreedRules.value || !confirmedAvailability.value) {
      setError('Please agree and confirm to proceed');
      return;
    }

    clearError();
    setLoading(true);
    try {
      // Example multipart request
      final uri = Uri.parse('https://api.example.com/join-league');
      final request = http.MultipartRequest('POST', uri)
        ..fields['team_name'] = teamNameController.text
        ..fields['captain_name'] = captainNameController.text
        ..fields['partner_name'] = partnerNameController.text
        ..fields['email'] = emailController.text
        ..fields['contact_number'] = contactNumberController.text
        ..fields['league'] = selectedLeague.value
        ..fields['player_level'] = (selectedPlayerLevelId.value ?? 0)
            .toString();

      final XFile? logo = selectedLogo.value;
      if (logo != null) {
        request.files.add(await http.MultipartFile.fromPath('logo', logo.path));
      }

      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);
      DPrint.info(
        'Join league response ${response.statusCode}: ${response.body}',
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Get.snackbar(
          'Application Submitted',
          'We will review and get back to you',
        );
      } else {
        setError('Failed to submit. Please try again.');
      }
    } catch (e) {
      setError('Submission error');
    } finally {
      setLoading(false);
    }
  }
}
