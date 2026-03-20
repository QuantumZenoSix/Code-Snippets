sub add_bucket_with_object_lock {
    my ($self, $conf) = @_;
    my $bucket = $conf->{bucket};

    croak 'must specify bucket' unless $bucket;

    if ($conf->{acl_short}) {
        $self->_validate_acl_short($conf->{acl_short});
    }

    my $header_ref = { 'x-amz-bucket-object-lock-enabled' => 'true' };

    my $data = '';
    if (defined $conf->{location_constraint}) {
        $data = qq (
            <CreateBucketConfiguration>
                <LocationConstraint>$conf->{location_constraint}</LocationConstraint>
            </CreateBucketConfiguration>
            <ObjectLockConfiguration>
                <ObjectLockEnabled>Enabled</ObjectLockEnabled>
            </ObjectLockConfiguration>
        );
    }else{ return 0 ;}


    return 0
      unless $self->_send_request_expect_nothing('PUT', "$bucket/", $header_ref, $data);

    return $self->bucket($bucket);
}