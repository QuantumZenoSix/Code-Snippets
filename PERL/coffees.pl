#!/usr/bin/perl -w 
use strict;                         #strict mode
use diagnostics;
use CGI qw(:standard);              #add CGI.pm module
use CGI::Carp qw/fatalsToBrowser/;  #show real errors
use strict;                         #strict mode
use diagnostics;
print header();

### read form data

if(param('action')){
    
        my $name = param('Name');
        my $flavor = param('Flavor');
        my $rating = param('Rating');
        my $ID = param('ID');
        print "<p>Deleted your $flavor Coffee!</p>";
        
        
}

elsif(param('Flavor')){

  my $name = param('Name');
  my $flavor = param('Flavor');
  my $rating = param('Rating');
  print "<p>Added your $flavor Coffee!</p>";
  
}



print start_html('Cool new title');

print <<"END_HTML";
    <h1>Perl/CGI + SQL</h1>
    <h3>Coffees</h3>
END_HTML



#my $conn = DBI->connect("DBI:mysql:database=3655197_drinks;host=fdb27.tekcities.com","3655197_drinks","password1234!",{'RaiseError' => 1});
my $sql = $conn->prepare("SELECT * from coffees");
$sql->execute();





my($id, $name,$flavor,$rating);


while(($id, $name,$flavor,$rating) = $sql->fetchrow()){

   
print <<"END_HTML";
   <div style="background-color:#dcd6f2;" >
      <div style="width:60%; margin: 0 auto; padding: 8px;">
         
         <p style="width:300px">
            <span style="font-weight:bold;">
               Name: 
             </span>
             $name
         </p>
         <p style="width:300px">
             <span style="font-weight:bold;">
                 Flavor: 
             </span>
             $flavor
         </p>
         <p style="width:300px">
             <span style="font-weight:bold;">
                Rating: 
             </span>
             $rating
        </p>
         <a href="?ID=$id&Name=$name&Flavor=$flavor&Rating=$rating&action=delete">Delete</a>
         <hr/>
         
      </div>
   </div>
END_HTML
}

print <<"END_HTML";

<h1>Add a Custom Coffee</h1>

    <form method="post" action="coffees.pl">
        <label>
                Coffee Name: <input name="Name" type="text">
        </label>
        <label>
                Flavor:<input name="Flavor" type="text">
        </label>
        <label>
                Rating:<input name="Rating" type="number">
        </label>
        
        <input type="submit" value="Add!" name="submit">
    </form>
END_HTML


print end_html();




