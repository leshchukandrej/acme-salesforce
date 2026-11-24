@IsTest
private class AccountRatingTest {
    @IsTest static void ratingFollowsRevenueOnInsertWhenUnset() {
        insert new List<Account>{
            new Account(Name = 'Hot', AnnualRevenue = 1000000),
            new Account(Name = 'Warm', AnnualRevenue = 100000),
            new Account(Name = 'Cold', AnnualRevenue = 99999),
            new Account(Name = 'None')
        };
        Map<String, Account> byName = new Map<String, Account>();
        for (Account a : [SELECT Name, Rating FROM Account]) byName.put(a.Name, a);
        Assert.areEqual('Hot', byName.get('Hot').Rating);
        Assert.areEqual('Warm', byName.get('Warm').Rating);
        Assert.areEqual('Cold', byName.get('Cold').Rating);
        Assert.areEqual('Cold', byName.get('None').Rating);
    }

    @IsTest static void keepsRatingSalesGaveOnInsert() {
        Account a = new Account(Name = 'Kept', Rating = 'Warm', AnnualRevenue = 5000000);
        insert a;
        Assert.areEqual('Warm', [SELECT Rating FROM Account WHERE Id = :a.Id].Rating);
    }

    @IsTest static void keepsExistingRatingOnUpdate() {
        Account a = new Account(Name = 'Up', Rating = 'Warm');
        insert a;
        a.AnnualRevenue = 2000000;
        update a;
        Assert.areEqual('Warm', [SELECT Rating FROM Account WHERE Id = :a.Id].Rating);
    }

    @IsTest static void ratesOnUpdateWhenRatingCleared() {
        Account a = new Account(Name = 'Cleared', Rating = 'Cold');
        insert a;
        a.Rating = null;
        a.AnnualRevenue = 2000000;
        update a;
        Assert.areEqual('Hot', [SELECT Rating FROM Account WHERE Id = :a.Id].Rating);
    }
}
