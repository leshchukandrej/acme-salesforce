public with sharing class OrderStatusLabel {
    public static String labelFor(String status) {
        switch on status {
            when 'Draft' { return 'Not sent yet'; }
            when 'Activated' { return 'On its way'; }
            when else { return status; }
        }
    }
}
