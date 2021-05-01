part of 'manage_coupons_bloc.dart';

@immutable
abstract class ManageCouponsState {}

class ManageCouponsInitial extends ManageCouponsState {}

class ApplyCouponCompletedState extends ManageCouponsState {
  final Coupon res;

  ApplyCouponCompletedState(this.res);
}

class ApplyCouponFailedState extends ManageCouponsState {}

class ApplyCouponInProgressState extends ManageCouponsState {}
