@IsTest
private class AccountRatingTest {
    @IsTest static void ratingFollowsRevenueOnInsert() {
        insert new List<Account>{
            new Account(Name = 'Hot Co', AnnualRevenue = 1000000),
            new Account(Name = 'Warm Co', AnnualRevenue = 100000),
            new Account(Name = 'Cold Co', AnnualRevenue = 99999),
            new Account(Name = 'No Revenue Co')
        };
        Map<String, Account> byName = load();
        Assert.areEqual('Hot', byName.get('Hot Co').Rating);
        Assert.areEqual('Warm', byName.get('Warm Co').Rating);
        Assert.areEqual('Cold', byName.get('Cold Co').Rating);
        Assert.areEqual('Cold', byName.get('No Revenue Co').Rating);
    }

    @IsTest static void ratingRecalculatedOnUpdate() {
        Account a = new Account(Name = 'Grow Co', AnnualRevenue = 500);
        insert a;
        a.AnnualRevenue = 2000000;
        update a;
        Assert.areEqual('Hot', load().get('Grow Co').Rating);

        a.AnnualRevenue = 150000;
        a.Rating = 'Hot';
        update a;
        Assert.areEqual('Warm', load().get('Grow Co').Rating);
    }

    private static Map<String, Account> load() {
        Map<String, Account> result = new Map<String, Account>();
        for (Account a : [SELECT Name, Rating FROM Account]) {
            result.put(a.Name, a);
        }
        return result;
    }
}
