@IsTest
private class ShippingCostTest {
    @IsTest static void costGrowsWithWeight() {
        Assert.areEqual(5, ShippingCost.costFor(0.5));
        Assert.areEqual(12, ShippingCost.costFor(7));
        Assert.areEqual(15, ShippingCost.costFor(12));
    }
}
