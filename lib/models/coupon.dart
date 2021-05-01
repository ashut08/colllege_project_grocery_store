import 'package:cloud_firestore/cloud_firestore.dart';

class Coupon {
  bool active;
  String couponCode;
  String couponId;
  String discount;
  String noOfUses;
  String type;
  String typeDesc;
  Timestamp fromDate;
  Timestamp toDate;
  var usedNoOfTimes;

  Coupon({
    this.couponCode,
    this.couponId,
    this.discount,
    this.active,
    this.noOfUses,
    this.type,
    this.usedNoOfTimes,
    this.typeDesc,
    this.fromDate,
    this.toDate,
  });

  factory Coupon.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return Coupon(
      couponCode: data['couponCode'],
      couponId: data['couponId'],
      discount: data['discount'],
      active: data['active'],
      noOfUses: data['noOfUses'],
      type: data['type'],
      fromDate: data['fromDate'],
      toDate: data['toDate'],
      typeDesc: data['typeDesc'],
      usedNoOfTimes: data['usedNoOfTimes'],
    );
  }
}
