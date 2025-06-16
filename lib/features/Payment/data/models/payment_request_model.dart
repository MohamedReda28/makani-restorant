class PaymentRequestModel {
  final String amount;
  final String currency;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final String callbackUrl;
  final String paymentType; // مثل "visa" أو "vodafone_cash"

  PaymentRequestModel({
    required this.amount,
    required this.currency,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.callbackUrl,
    required this.paymentType,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
      'customer_name': customerName,
      'customer_email': customerEmail,
      'customer_phone': customerPhone,
      'callback_url': callbackUrl,
      'payment_type': paymentType,
    };
  }
}