public with sharing class AccountRating {
    public static String ratingFor(Decimal annualRevenue) {
        if (annualRevenue != null && annualRevenue >= 1000000) return 'Hot';
        if (annualRevenue != null && annualRevenue >= 100000) return 'Warm';
        return 'Cold';
    }

    /** Rates by revenue only when no rating was set; a rating sales gave is kept. */
    public static void apply(List<Account> accounts) {
        for (Account a : accounts) {
            if (String.isBlank(a.Rating)) {
                a.Rating = ratingFor(a.AnnualRevenue);
            }
        }
    }
}
