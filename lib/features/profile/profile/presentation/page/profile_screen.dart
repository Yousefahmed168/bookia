import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigations.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/text_styles.dart';
import '../../../../../core/widgets/my_body_view.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../auth/presentation/page/login_screen.dart';
import '../../../edit_profile/cubit/edit_profile_cubit.dart';
import '../../../edit_profile/cubit/edit_profile_state.dart';
import '../widgets/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var profileData = SharedPref.getUserInfo();
    return BlocProvider(
      create: (context) => EditProfileCubit()..loadInitData(),
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is LogoutLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else if (state is LogoutSuccessState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
          } else if (state is LogoutErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Failed to logout')));
          }
        },

        child: Builder(
          builder: (context) => Scaffold(
            backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text('Profile', style: TextStyles.title),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<EditProfileCubit>().logout();
                },
                icon: CustomSvgPicture(path: AppImages.logoutSvg),
              ),
            ],
          ),
          body: MyBodyView(
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: profileData?.image ?? '',
                        height: 100,
                        width: 100,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.person,
                          size: 100,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Gap(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profileData?.name ?? '',
                          style: TextStyles.subtitle1,
                        ),
                        Text(
                          profileData?.email ?? '',
                          style: TextStyles.body.copyWith(
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      return ListView(
                        children: [
                          ProfileItem(
                            title: 'My Orders',
                            onTap: () => pushTo(context, Routes.myOrders),
                          ),
                          ProfileItem(
                            title: 'Edit Profile',
                            onTap: () {
                              pushTo(context, Routes.editProfile).then((value) {
                                setState(() {});
                              });
                            },
                          ),
                          ProfileItem(
                            title: 'Reset Password',
                            onTap: () => pushTo(context, Routes.resetPassword),
                          ),
                          ProfileItem(title: 'FAQ', onTap: () {}),
                          ProfileItem(title: 'Contact Us', onTap: () {}),
                          ProfileItem(title: 'Privacy & Terms', onTap: () {}),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),  // Scaffold
        ),  // Builder
      ),    // BlocListener
    );
  }
}
