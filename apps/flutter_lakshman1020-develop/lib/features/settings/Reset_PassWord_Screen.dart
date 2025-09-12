// import 'package:flutter/material.dart';
// import 'package:flutter_lakshman1020/core/constants/app_colors.dart';

// import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
// import 'package:flutter_lakshman1020/core/widgets/primary_button.dart';

// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({super.key});

//   @override
//   _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
// }

// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       appBar: AppBar(
//         title: const Text("Reset Password"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: ListView(
//           children: [
//             const SizedBox(height: 20),
//             const Divider(height: 1, thickness: 1, color: TColors.grey2),
//             const SizedBox(height: 18),
//             const Text(
//               "Your new password must be different from previous used password.",
//               style: TextStyle(fontSize: 16, color: TColors.deliveryDetails),
//             ),
//             const SizedBox(height: 30),
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                       hintText: "Must be at least 8 characters",
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password cannot be empty';
//                       }
//                       if (value.length < 8) {
//                         return 'Password must be at least 8 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     controller: _confirmPasswordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: "Confirm Password",
//                       // hintText: "Both passwords must match",
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Confirm password cannot be empty';
//                       }
//                       if (value != _passwordController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         // Proceed with password reset logic
//                         // For example, send password to backend
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Password reset successful'),
//                           ),
//                         );
//                       }
//                     },

//                     child: context.primaryButton(
//                       onPressed: () {},
//                       text: "Save",
//                       width: double.infinity,
//                       height: 51,
//                       backgroundColor: TColors.primary,
//                       textColor: TColors.account,
//                       borderRadius: 8.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
import 'package:flutter_lakshman1020/core/widgets/primary_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back using GetX
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Divider(height: 1, thickness: 1, color: TColors.grey2),
            const SizedBox(height: 18),
            const Text(
              "Your new password must be different from previous used password.",
              style: TextStyle(fontSize: 16, color: TColors.deliveryDetails),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      helperText:
                          "Must be at least 8 characters", // ✅ This appears below the field
                      helperStyle: TextStyle(
                        fontSize: 12,
                        color: TColors.deliveryDetails, // optional color
                      ),
                      helperMaxLines: 1,
                      // hintText: "Must be at least 8 characters",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Confirm Password Field
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,

                    decoration: const InputDecoration(
                      labelText: "Confirm Password",
                      helperText:
                          "Both password must match", // ✅ This appears below the field
                      helperStyle: TextStyle(
                        fontSize: 12,
                        color: TColors.deliveryDetails, // optional color
                      ),
                      helperMaxLines: 1,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password cannot be empty';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Primary Button
                  context.primaryButton(
                    text: "Save",
                    width: double.infinity,
                    height: 51,
                    backgroundColor: TColors.primary,
                    textColor: TColors.account,
                    borderRadius: 8.0,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Replace with your password reset logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password reset successful'),
                          ),
                        );
                        Get.back(); // Navigate back after reset
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
