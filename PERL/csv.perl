=========== Create CSV
#! /usr/bin/perl

require './header1.pl';

  my $query = "
              SELECT msdidusagehistory, msdid, updatedate, msdid_totalusage_mb, msdid_totalusage_bytes
              FROM  MemberStorageDetailsUsageHistory 
              WHERE msdid='82533'
              ORDER BY updatedate
              
      ";
  $sth = $dbmeta001->prepare($query);
  $sth->execute;
  $data_points = $sth->fetchall_arrayref();

  my $prev_update_date = 0;
  my $hour_interval = 1;

  my $usage_history_csv = "";
  # my $usage_history_csv = "msdid,updatedate\n";
  my $date_row = my $msdid_row = my $usage_row = my $header_row = '';

  for my $d (0 .. $#{$data_points} ){

      my $msdid = $data_points->[$d][1];
      my $update_date = $data_points->[$d][2];
      my $usage_mb = $data_points->[$d][3];
      my $datestring = &get_date_string_from_epoch("$update_date");

      # Keep first iteration
      next if $d > 0 && ( $update_date < ($prev_update_date + (3600 * $hour_interval)) );
      $prev_update_date = $update_date;

      $date_row .= $d == 0 ? "\"\"," : "\"$datestring\",";
      $header_row .= $d == 0 ? "\"msdid\"," : "\"(msdid_total_usage_mb)\",";
      $usage_row .= $d == 0 ? "\"$msdid\"," : "\"$usage_mb\",";
  }
  
  $usage_history_csv = "$date_row\n$header_row\n$usage_row";
  print $usage_history_csv;

# perl scriptname.pl > new.csv