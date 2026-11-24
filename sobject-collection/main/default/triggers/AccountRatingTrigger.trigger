trigger AccountRatingTrigger on Account (before insert, before update) {
    AccountRating.apply(Trigger.new);
}
