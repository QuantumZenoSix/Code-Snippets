#!/usr/bin/perl -T
 
use strict;
use warnings;
use CGI;
use CGI::Carp qw/fatalsToBrowser/;
use File::Basename;
 
$CGI::POST_MAX = 1024 * 5000; #adjust as needed (1024 * 5000 = 5MB)
$CGI::DISABLE_UPLOADS = 0; #1 disables uploads, 0 enables uploads
 
my $query = CGI->new;
 
unless ($CGI::VERSION >= 2.47) { 
   error('Your version of CGI.pm is too old. You must have verison 2.47 or higher to use this script.')
}
 
my $upload_dir = '/home/control-io/www/';
my $filename = $query->param("file");
my $upload_filehandle = $query->upload("file");

open (UPLOADFILE, ">$upload_dir/$filename") or error($!);
binmode UPLOADFILE;
while ( <$upload_filehandle> ) {
   print UPLOADFILE;
}
close UPLOADFILE;
 
print $query->header(),
      $query->start_html(title=>'Upload Successful'),
      $query->p("Upload complete. File Location on remote machine: '$upload_dir$filename"),
      $query->end_html;
 
 
sub error {
   print $query->header(),
         $query->start_html(-title=>'Error'),
         shift,"Custom msg here",
         $query->end_html;
   exit(0);
}
