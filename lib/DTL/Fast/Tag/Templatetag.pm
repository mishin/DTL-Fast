package DTL::Fast::Tag::Templatetag;
use strict; use utf8; use warnings FATAL => 'all'; 
use parent 'DTL::Fast::Tag::Simple';
use Carp qw(confess);

$DTL::Fast::TAG_HANDLERS{'templatetag'} = __PACKAGE__;

our %TAG_MAP = (
    'openblock'     => '{%',
    'closeblock'    => '%}',
    'openvariable'  => '{{',
    'closevariable' => '}}',
    'openbrace'     => '{',
    'closebrace'    => '}',
    'opencomment'   => '{#',
    'closecomment'  => '#}',
);

#@Override
sub parse_parameters
{
    my $self = shift;
    
    if( not ($self->{'value'} = $TAG_MAP{$self->{'parameter'}}))
    {
        confess "Unknown template tag $self->{'parameter'}";
    }
    
    return $self;
}

#@Override
sub render
{
    return shift->{'value'};
}

1;