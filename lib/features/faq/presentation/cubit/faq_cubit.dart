import 'package:bookia/features/faq/data/models/faq_model.dart';
import '../../domain/usecases/get_faqs_use_case.dart';
import 'package:bookia/features/faq/presentation/cubit/faq_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqCubit extends Cubit<FaqState> {
  final GetFaqsUseCase getFaqsUseCase;

  FaqCubit(this.getFaqsUseCase) : super(FaqInitial());

  List<FaqModel> faqs = [];

  Future<void> getFaqs() async {
    emit(FaqLoadingState());
    var response = await getFaqsUseCase();

    response.fold(
      (l) => emit(FaqErrorState(l.message)),
      (r) {
        faqs = r;
        emit(FaqSuccessState());
      },
    );
  }
}
