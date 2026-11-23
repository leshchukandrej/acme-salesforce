@IsTest
private class OrderStatusLabelTest {
    @IsTest static void knownStatusesGetFriendlyLabels() {
        Assert.areEqual('Not sent yet', OrderStatusLabel.labelFor('Draft'));
        Assert.areEqual('On its way', OrderStatusLabel.labelFor('Activated'));
        Assert.areEqual('Cancelled', OrderStatusLabel.labelFor('Cancelled'));
    }
}
