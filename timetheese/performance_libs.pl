#!/usr/bin/perl -I../lib/

use Benchmark qw(:all);
use DTL::Fast qw(get_template);
use Storable qw(freeze thaw);
use Compress::Zlib;

timethese( 300, {
    'warnings      ' => sub{system 'perl use_warnings.pl';},
    'strict        ' => sub{system 'perl use_strict.pl';},
    'Storable      ' => sub{system 'perl use_storable.pl';},
    'Digest::MD5   ' => sub{system 'perl use_digest_md5.pl';},
    'Compress::Zlib' => sub{system 'perl use_compress_zlib.pl';},
});
