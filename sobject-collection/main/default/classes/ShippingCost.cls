public with sharing class ShippingCost {
    public static Decimal costFor(Decimal weightKg) {
        if (weightKg <= 1) return 5;
        if (weightKg <= 10) return 12;
        return 12 + Math.ceil(weightKg - 10) * 1.5;
    }
}
