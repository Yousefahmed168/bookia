import 'package:easy_localization/easy_localization.dart';
import '../../../../core/routes/navigations.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/my_body_view.dart';
import '../../../../core/widgets/dialog.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../cubit/place_order_cubit.dart';
import '../cubit/place_order_state.dart';
import '../widgets/gov_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatefulWidget {
  final String? total;

  const PlaceOrderScreen({super.key, this.total});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _governorateController = TextEditingController();
  int? _selectedGovernorateId;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _governorateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceOrderCubit()..getGovernorates(),
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
                  Text('place_your_order'.tr(), style: TextStyles.headline),
                  const Gap(10),
                  Text(
                    'forgot_password_desc'.tr(),
                    style: TextStyles.body.copyWith(color: Colors.grey),
                  ),
                  const Gap(28),
                  CustomTextFormField(
                    controller: _fullNameController,
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
                    controller: _addressController,
                    hintText: 'address'.tr(),
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please_enter_address'.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomTextFormField(
                    controller: _phoneController,
                    hintText: 'phone'.tr(),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please_enter_phone'.tr();
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
                    builder: (context, state) {
                      return CustomTextFormField(
                        controller: _governorateController,
                        hintText: 'governorate'.tr(),
                        readOnly: true,
                        onTap: () {
                          if (state is GovernoratesSuccessState) {
                            var cubit = context.read<PlaceOrderCubit>();
                            showGovernorateBottomSheet(
                              context,
                              cubit.governorates,
                              (selectedGov) {
                                setState(() {
                                  _governorateController.text =
                                      selectedGov.governorateNameEn ?? '';
                                  _selectedGovernorateId = selectedGov.id;
                                });
                              },
                            );
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_select_gov'.tr();
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.arrow_drop_down),
                      );
                    },
                  ),
                  const Gap(32),
                  Row(
                    children: [
                      Text('total_with_colon'.tr(), style: TextStyles.subtitle1),
                      const Spacer(),
                      Text('\$ ${widget.total}', style: TextStyles.subtitle1),
                    ],
                  ),
                  const Gap(16),
                  BlocConsumer<PlaceOrderCubit, PlaceOrderState>(
                    listener: (context, state) {
                      if (state is PlaceOrderLoading) {
                        showLoadingDialog(context);
                      } else if (state is PlaceOrderSuccess) {
                        Navigator.pop(context); // close loading
                        // refresh cart
                        context.read<CartCubit>().getCart();
                        pushTo(context, Routes.orderSuccess);
                      } else if (state is PlaceOrderError) {
                        Navigator.pop(context); // close loading
                        showMyDialog(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      return MainButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _selectedGovernorateId != null) {
                            context.read<PlaceOrderCubit>().placeOrder(
                                  name: _fullNameController.text,
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  address: _addressController.text,
                                  governorateId: _selectedGovernorateId!,
                                );
                          } else if (_selectedGovernorateId == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('please_select_gov'.tr())),
                            );
                          }
                        },
                        text: 'submit_order'.tr(),
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
