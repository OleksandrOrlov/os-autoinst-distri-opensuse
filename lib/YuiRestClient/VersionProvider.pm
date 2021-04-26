# SUSE's openQA tests
#
# Copyright © 2021 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved. This file is offered as-is,
# without any warranty.

# Summary: Provides certain API version of libyui-rest-api depending
# on the product version and distribution.

# Maintainer: QE YaST <qa-sle-yast@suse.de>

package YuiRestClient::VersionProvider;
use strict;
use warnings;
use version_utils;

use constant LATEST_VERSION => 'v1.1';

=head2 provide

  provide();

Returns version of libyui-rest-api API depending on the version of the product.

=cut
sub provide {
    return 'v1';
}

1;