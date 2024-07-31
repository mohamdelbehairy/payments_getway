import 'package:flutter_bloc/flutter_bloc.dart';

part 'strip_payment_state.dart';

class StripPaymentCubit extends Cubit<StripPaymentState> {
  StripPaymentCubit() : super(StripPaymentInitial());
}
