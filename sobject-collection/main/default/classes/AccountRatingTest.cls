@IsTest
private class AccountRatingTest {
    @IsTest static void insertSetsRating() {
        List<Account> accs = new List<Account>{
            new Account(Name = 'Hot', AnnualRevenue = 1000000),
            new Account(Name = 'Warm', AnnualRevenue = 100000),
            new Account(Name = 'WarmHigh', AnnualRevenue = 999999),
            new Account(Name = 'Cold', AnnualRevenue = 99999),
            new Account(Name = 'NoRevenue')
        };
        insert accs;
        Map<String, Account> byName = new Map<String, Account>();
        for (Account a : [SELECT Name, Rating FROM Account]) byName.put(a.Name, a);
        Assert.areEqual('Hot', byName.get('Hot').Rating);
        Assert.areEqual('Warm', byName.get('Warm').Rating);
        Assert.areEqual('Warm', byName.get('WarmHigh').Rating);
        Assert.areEqual('Cold', byName.get('Cold').Rating);
        Assert.areEqual('Cold', byName.get('NoRevenue').Rating);
    }

    @IsTest static void keepsRatingAlreadySet() {
        Account a = new Account(Name = 'Sales', AnnualRevenue = 2000000, Rating = 'Cold');
        insert a;
        Assert.areEqual('Cold', [SELECT Rating FROM Account WHERE Id = :a.Id].Rating);
    }

    @IsTest static void updateRatesWhenRatingBlank() {
        Account a = new Account(Name = 'Acme', Rating = 'Warm');
        insert a;
        a.Rating = null;
        a.AnnualRevenue = 2000000;
        update a;
        Assert.areEqual('Hot', [SELECT Rating FROM Account WHERE Id = :a.Id].Rating);
    }
}
