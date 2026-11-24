@IsTest
private class VipDiscountTest {
    @IsTest static void vipGetsFifteenPercentOff() {
        Assert.areEqual(85.00, VipDiscount.priceFor(100, true));
        Assert.areEqual(100, VipDiscount.priceFor(100, false));
    }
}
