part of 'manage_coupons_bloc.dart';

@immutable
abstract class ManageCouponsEvent {}

class ApplyCoupon extends ManageCouponsEvent {
  final Map map;

  ApplyCoupon(this.map);
}
