import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_store/models/coupon.dart';

import 'package:grocery_store/repositories/user_data_repository.dart';
import 'package:meta/meta.dart';

part 'manage_coupons_event.dart';
part 'manage_coupons_state.dart';

class ManageCouponsBloc extends Bloc<ManageCouponsEvent, ManageCouponsState> {
  final UserDataRepository userDataRepository;

  ManageCouponsBloc({this.userDataRepository}) : super(ManageCouponsInitial());

  @override
  Stream<ManageCouponsState> mapEventToState(
    ManageCouponsEvent event,
  ) async* {
    if (event is ApplyCoupon) {
      yield* mapApplyCouponToState(event.map);
    }
  }

  Stream<ManageCouponsState> mapApplyCouponToState(Map map) async* {
    yield ApplyCouponInProgressState();
    try {
      Coupon res = await userDataRepository.applyCoupon(map);
      if (res != null) {
        yield ApplyCouponCompletedState(res);
      } else {
        yield ApplyCouponFailedState();
      }
    } catch (e) {
      print(e);
      yield ApplyCouponFailedState();
    }
  }
}
