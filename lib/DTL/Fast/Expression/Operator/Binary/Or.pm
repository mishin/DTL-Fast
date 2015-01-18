package DTL::Fast::Expression::Operator::Binary::Or;
use strict; use utf8; use warnings FATAL => 'all'; 
use parent 'DTL::Fast::Expression::Operator::Binary::Logical';

$DTL::Fast::Expression::Operator::KNOWN{'or'} = __PACKAGE__;

use DTL::Fast::Utils qw(has_method);

sub dispatch
{
    my( $self, $arg1, $arg2) = @_;

    if( 
        ref $arg1
        and has_method($arg1, 'or') 
    )
    {
        return $arg1->or($arg2);
    }
    else
    {
        return $arg1 || $arg2;
    }
}

1;