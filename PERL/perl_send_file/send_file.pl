#!/usr/bin/perl 
 
use strict;
use warnings;

use LWP::UserAgent;
use HTTP::Request::Common qw( POST );

# Path to file you want to send
my $file = 'testerfile_01.zip';
# Name for new file
my $filename = 'testing_file_name.zip';

# Remote machine must have fileprocess1.pl to handle file
my $url = 'http://localhost/HiveDeets/accept_file.pl';
my $ua = LWP::UserAgent->new( keep_alive => 1 );
my $res = $ua->post(
    $url,                          # where to send it
    Content_Type => 'form-data',   # key/value pairs of headers
    Content =>                     # the form VVV
    {
        'name' => 'somesendvalue',
        'file' =>  [ $file, $filename ]
    }
);

my $message = $res->decoded_content;
if ( $res->is_success ) {
    print "GOOD POST Received reply: $message\n\n";
}else{
    print "ERROR POST Received reply: $message\n\n";
}
