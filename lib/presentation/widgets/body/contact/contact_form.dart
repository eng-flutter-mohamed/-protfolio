import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    _nameController.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  void _sendEmail() async {
    if (!_formKey.currentState!.validate()) return;

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'mohamedmflutter.dev@gmail.com',
      query: _encodeQueryParameters({
        'subject': _subjectController.text,
        'body':
            'From: ${_nameController.text} (${_emailController.text})\n\n${_messageController.text}',
      }),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppStrings.contactError.tr)),
      );
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getFormWidth(context.width),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              style: AppStyles.s14,
              decoration:
                  InputDecoration(labelText: AppStrings.contactNameLabel.tr),
              validator: (value) =>
                  value!.isEmpty ? AppStrings.validationName.tr : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              style: AppStyles.s14,
              decoration:
                  InputDecoration(labelText: AppStrings.contactEmailLabel.tr),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.validationEmail.tr;
                }
                if (!value.contains('@')) {
                  return AppStrings.validationEmailInvalid.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _subjectController,
              style: AppStyles.s14,
              decoration:
                  InputDecoration(labelText: AppStrings.contactSubjectLabel.tr),
              validator: (value) =>
                  value!.isEmpty ? AppStrings.validationSubject.tr : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              style: AppStyles.s14,
              decoration: InputDecoration(
                labelText: AppStrings.contactMessageLabel.tr,
              ),
              validator: (value) =>
                  value!.isEmpty ? AppStrings.validationMessage.tr : null,
            ),
            const SizedBox(height: 16),
            CustomButton(
              label: AppStrings.contactSubmit.tr,
              onPressed: _sendEmail,
              backgroundColor: AppColors.primaryColor,
              width: _getFormWidth(context.width),
            ),
          ],
        ),
      ),
    );
  }

  double _getFormWidth(double deviceWidth) {
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return deviceWidth;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return deviceWidth / 1.6;
    } else if (deviceWidth < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return deviceWidth / 2;
    } else {
      return deviceWidth / 2.5;
    }
  }
}
