public with sharing class AccountRating {
    public static String ratingFor(Decimal annualRevenue) {
        if (annualRevenue != null && annualRevenue >= 1000000) return 'Hot';
        if (annualRevenue != null && annualRevenue >= 100000) return 'Warm';
        return 'Cold';
    }

    public static void apply(List<Account> accounts) {
        for (Account a : accounts) {
            a.Rating = ratingFor(a.AnnualRevenue);
        }
    }
}
