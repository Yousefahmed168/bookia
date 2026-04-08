import 'package:easy_localization/easy_localization.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/dialog.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/my_body_view.dart';
import '../cubit/contact_us_cubit.dart';
import '../cubit/contact_us_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactUsCubit, ContactUsState>(
      listener: (context, state) {
        if (state is ContactUsSuccessState) {
          showMyDialog(context, 'message_sent_success'.tr(),
              type: DialogType.success);
          Navigator.pop(context);
        }
        if (state is ContactUsErrorState) {
          showMyDialog(context, state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const CustomBackButton(),
          automaticallyImplyLeading: false,
        ),
        body: MyBodyView(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('contact_us'.tr(), style: TextStyles.headline),
                  const Gap(24),
                  CustomTextFormField(
                    controller: _nameController,
                    hintText: 'fullname'.tr(),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please_enter_full_name'.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomTextFormField(
                    controller: _emailController,
                    hintText: 'email'.tr(),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please_enter_email'.tr();
                      }
                      if (!value.contains('@')) {
                        return 'invalid_email'.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomTextFormField(
                    controller: _subjectController,
                    hintText: 'subject'.tr(),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please_enter_subject'.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: _messageController,
                    maxLines: 5,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'message'.tr(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please_enter_message'.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(32),
                  BlocBuilder<ContactUsCubit, ContactUsState>(
                    builder: (context, state) {
                      return MainButton(
                        onPressed: state is ContactUsLoadingState
                            ? () {}
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<ContactUsCubit>().sendMessage(
                                        name: _nameController.text,
                                        email: _emailController.text,
                                        subject: _subjectController.text,
                                        message: _messageController.text,
                                      );
                                }
                              },
                        text: state is ContactUsLoadingState
                            ? 'loading'.tr()
                            : 'send_message'.tr(),
                      );
                    },
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}