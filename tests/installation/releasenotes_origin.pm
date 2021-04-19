# SUSE's openQA tests
#
# Copyright © 2017-2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: Check origin of displayed releasenotes during installation
# Maintainer: mgriessmeier <mgriessmeier@suse.com>, Nick Singer <nsinger@suse.de>
# Tags: fate#323273, poo#26786

use base 'y2_installbase';
use strict;
use warnings;
use testapi;
use version_utils ':VERSION';

sub run {
    assert_screen('release-notes-button');
    send_key('ctrl-shift-alt-x');
    assert_screen('yast-xterm');
    my $src = check_var('SCC_REGISTER', 'installation') ? "RPM" : "URL";
    enter_cmd "grep -o \"Got release notes.*\" /var/log/YaST2/y2log";
    assert_screen [qw(got-releasenotes-RPM got-releasenotes-URL)];
    unless (match_has_tag "got-releasenotes-$src") {
        die "Release notes source does NOT match expectaions or not found in YaST logs, expected source: $src";
    }
    enter_cmd "exit";
    # If we don't have system role screen, release notes origin is verified on partitioning screen
    my $current_screen = is_using_system_role() ? 'system-role-default-system' : 'partitioning-edit-proposal-button';
    assert_screen $current_screen, 180;
}

1;