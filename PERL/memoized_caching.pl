use strict;
use warnings;

# Memoize function in Perl
sub memoize {
    my ($todo) = @_;
    my %cache;

    return sub {
        my ($val) = @_;

        # Check if the result is already cached
        if (exists $cache{$val}) {
            print "Using cached result 🙂\n";
            return $cache{$val};
        }

        # Perform the operation and cache the result
        $cache{$val} = $todo->($val);
        return $cache{$val};
    };
}

# Function to multiply a value by three
sub multiplyByThree {
    my ($value) = @_;
    print "Calculating...\n";
    return $value * 3;
}

# Create a memoized version of the multiplyByThree function
my $memoizedMultiplyThree = memoize(\&multiplyByThree);

# Call the memoized function and print the result
my $result = $memoizedMultiplyThree->(2);
print "$result\n";

# Call again with the same value to use the cached result
my $result2 = $memoizedMultiplyThree->(2);
print "$result2\n";

# Call with a different value to calculate and cache the new result
my $result3 = $memoizedMultiplyThree->(3);
print "$result3\n";
