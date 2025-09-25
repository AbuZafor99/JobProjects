import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/edit_profile_model.dart';
import '../controllers/contact_us_controller.dart';

class ProfileContactUsScreen extends StatelessWidget {
  final EditProfileModel member;

  final controller = Get.find<ContactUsController>();

  ProfileContactUsScreen({super.key, required this.member});

  // Create text editing controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final subjectController = TextEditingController();
  final yourCompanyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 22, left: 24, right: 24, bottom: 24),
          child: Column(
            children: [
              // First + Last Name
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: "First Name*",
                      hintText: "Enter Your Surname",
                      controller: firstNameController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      label: "Last Name*",
                      hintText: "Enter Your Last Name",
                      controller: lastNameController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Address
              _buildTextField(
                label: "Address",
                hintText: "Enter Your Address",
                controller: addressController,
              ),
              const SizedBox(height: 10),

              // Phone
              _buildTextField(
                label: "Phone Number",
                hintText: "Enter Phone Number",
                controller: phoneNumberController,
              ),
              const SizedBox(height: 10),

              // Subject
              _buildTextField(
                label: "Subject",
                hintText: "Enter Here",
                controller: subjectController,
              ),
              const SizedBox(height: 10),

              // Your Company (large height)
              _buildTextField(
                label: "Your Company",
                hintText: "Tell us how we can help you",
                maxLines: 8,
                controller: yourCompanyController,
              ),
              const SizedBox(height: 43),

              // Contact Information section
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact Information',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Email
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/contactus_mail.png",
                          width: 35,
                          height: 35,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'example@gmail.com',
                          style: TextStyle(
                            color: Color(0xFFA7A7A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),

                    // Phone
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/contactus_phone.png",
                          width: 35,
                          height: 35,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          '+880 1234 567890',
                          style: TextStyle(
                            color: Color(0xFFA7A7A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),

                    // Address
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/contactus_location.png",
                          width: 35,
                          height: 35,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          '123, Main Street, Dhaka',
                          style: TextStyle(
                            color: Color(0xFFA7A7A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),

                    // Time
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/contactus_clock.png",
                          width: 35,
                          height: 35,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'www.example.com',
                          style: TextStyle(
                            color: Color(0xFFA7A7A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                  ],
                ),
              ),

              const SizedBox(height: 43),

              // Error message
              Obx(() => controller.errorMessage.isNotEmpty
                  ? Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              )
                  : const SizedBox()),

              const SizedBox(height: 10),

              // Submit Button
              Align(
                alignment: Alignment.center,
                child: Obx(() => SizedBox(
                  height: 39,
                  width: 342,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B7FD0),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: controller.isLoading.value ? null : _submitForm,
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                      "Send Message",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Submit form method
  void _submitForm() {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final address = addressController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final subject = subjectController.text.trim();
    final yourCompany = yourCompanyController.text.trim();

    // Basic validation
    if (firstName.isEmpty || lastName.isEmpty) {
      controller.setError("First name and last name are required");
      return;
    }

    controller.clearError();
    controller.createContact(
      firstName: firstName,
      lastName: lastName,
      address: address,
      phoneNumber: phoneNumber,
      subject: subject,
      yourCompany: yourCompany,
    );
  }

  // Reusable TextField Builder with controller
  Widget _buildTextField({
    required String label,
    required String hintText,
    int maxLines = 1,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Color(0xFFA7A7A7), fontSize: 12, fontWeight: FontWeight.w400),
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFFA7A7A7), fontSize: 12),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF484848)),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
            ),
            fillColor: Colors.grey[900],
            filled: true,
          ),
        ),
      ],
    );
  }
}