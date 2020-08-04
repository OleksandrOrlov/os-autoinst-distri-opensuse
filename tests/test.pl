use warnings;
use strict;
use Test::Assert ':all';



sub verify_cryptsetup_properties {
    my ($expected_properties, $actual_properties) = @_;
    record_info("params", "Verify parameters, that are set for crypted volumes");
    foreach my $property (sort keys %{$expected_properties}) {
        diag("Verifying that expected property $expected_properties->{properties}{$property} corresponds to the actual $actual_properties->{properties}->{$property}");
        assert_equals($expected_properties->{$property}, $actual_properties->{$property},
            "Property of cryptsetup status does not match");
    }
}