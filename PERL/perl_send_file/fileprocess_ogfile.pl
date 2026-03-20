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
 
my $upload_dir = '/home/control-io/www';
 
# a list of valid characters that can be in filenames
my $filename_characters = 'a-zA-Z0-9_.-';
 
my $file = $query->param("photo") or error('No file selected for upload.') ;
my $email_address = $query->param("email") || 'Annonymous';
 
# get the filename and the file extension
# this could be used to filter out unwanted filetypes
# see the File::Basename documentation for details
my ($filename,undef,$ext) = fileparse($file,qr{\..*});
 
# append extension to filename
$filename .= $ext;
 
# convert spaces to underscores "_"
$filename =~ tr/ /_/;
 
# remove illegal characters
$filename =~ s/[^$filename_characters]//g;
 
# satisfy taint checking
if ($filename =~ /^([$filename_characters]+)$/) {
   $filename = $1;
}
else{
   error("The filename is not valid. Filenames can only contain these characters: $filename_characters")
}
 
# this is very crude but validating an email address is not an easy task
# and is beyond the scope of this article. To validate an email
# address properly use the Emaill::Valid module. I do not include
# it here because it is not a core module.
unless ($email_address =~ /^[\w@.-]+$/ && length $email_address < 250) {
   error("The email address appears invalid or contains too many characters. Limit is 250 characters.")
}    
 
my $upload_filehandle = $query->upload("photo");
 
open (UPLOADFILE, ">$upload_dir/$filename") or error($!);
binmode UPLOADFILE;
while ( <$upload_filehandle> ) {
   print UPLOADFILE;
}
close UPLOADFILE;
 
print $query->header(),
      $query->start_html(-title=>'Upload Successful'),
      $query->p('Thanks for uploading your photo!'),
      $query->p("Your email address: $email_address"),
      $query->p("Your photo $filename:"),
      $query->img({src=>"../uploads/$filename",alt=>''}),
      $query->end_html;
 
 
sub error {
   print $query->header(),
         $query->start_html(-title=>'Error'),
         shift,
         $query->end_html;
   exit(0);
}