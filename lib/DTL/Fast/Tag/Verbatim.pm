package DTL::Fast::Tag::Verbatim;
use strict; use utf8; use warnings FATAL => 'all'; 
use parent 'DTL::Fast::Tag';  
use Carp qw(confess);

$DTL::Fast::TAG_HANDLERS{'verbatim'} = __PACKAGE__;

use DTL::Fast::Text;

#@Override
sub get_close_tag{return 'endverbatim';}

#@Override
sub parse_parameters
{
    my $self = shift;
    $self->{'contents'} = DTL::Fast::Text->new();
    $self->{'last_tag'} = $self->{'parameter'} ?
        sprintf( '{%% %s %s %%}', $self->get_close_tag, $self->{'parameter'})
        : '{% endverbatim %}';
    return $self;
}

#@Override
sub parse_next_chunk
{
    my $self = shift;
    my $chunk = shift @{$self->{'raw_chunks'}};
    
    if( $chunk eq $self->{'last_tag'} )
    {
        $self->{'raw_chunks'} = []; # this stops parsing
    }
    else
    {
        $self->{'contents'}->append($chunk);
    }
    
    return;
}

#@Override
sub render
{
    return shift->{'contents'}->render(shift);
}

1;