public with sharing class VipDiscount {
    /** VIP customers get 15% off every order. */
    public static Decimal priceFor(Decimal amount, Boolean vip) {
        return vip ? (amount * 0.85).setScale(2) : amount;
    }
}
