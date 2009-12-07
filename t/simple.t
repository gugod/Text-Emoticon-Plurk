#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Text::Emoticon::Plurk;

my $text = "(banana_rock) Just another Perl Hacker (banana_rock)";

my $emoticon = Text::Emoticon::Plurk->new();
is($emoticon->filter($text), '<img src="http://statics.plurk.com/48515125401120316abb97666458d05b.gif"> Just another Perl Hacker <img src="http://statics.plurk.com/48515125401120316abb97666458d05b.gif">');

done_testing;


