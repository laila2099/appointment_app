class PaymentMethod {
  final String id;
  final String type;
  final String label;
  final String? last4;
  final bool isDefault;
  final String icon;

  const PaymentMethod({
    required this.id,
    required this.type,
    required this.label,
    this.last4,
    this.isDefault = false,
    required this.icon,
  });
}
