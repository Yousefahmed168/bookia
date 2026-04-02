import 'package:easy_localization/easy_localization.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_back_button.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/features/home/data/models/best_seller_books_response/product.dart';
import 'package:bookia/features/home/presentation/widgets/book_card.dart';
import 'package:bookia/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/features/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:bookia/core/utils/debouncer.dart';

class SearchScreen extends StatelessWidget {
  final List<Product> products;

  const SearchScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(products),
      child: const _SearchBody(),
    );
  }
}

class _SearchBody extends StatefulWidget {
  const _SearchBody();

  @override
  State<_SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<_SearchBody> {
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    _debouncer.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: _searchController,
                      hintText: 'search_hint'.tr(),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.darkColor,
                      ),
                      onChange: (value) {
                        _debouncer.run(() {
                          context.read<SearchCubit>().search(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitial) {
                      return Center(
                        child: Text(
                          'search_for_book'.tr(),
                          style: TextStyles.subtitle1.copyWith(
                            color: AppColors.darkColor,
                          ),
                        ),
                      );
                    }
                    if (state is SearchEmptyState) {
                      return Center(
                        child: Text(
                          'no_books_found'.tr(),
                          style: TextStyles.subtitle1.copyWith(
                            color: AppColors.darkColor,
                          ),
                        ),
                      );
                    }
                    if (state is SearchSuccessState) {
                      final results = context.read<SearchCubit>().searchResults;
                      return GridView.builder(
                        itemCount: results.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 11,
                              crossAxisSpacing: 11,
                              childAspectRatio: .6,
                            ),
                        itemBuilder: (context, index) {
                          return BookCard(product: results[index]);
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
