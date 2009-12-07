package Text::Emoticon::Plurk;
use strict;
use 5.005;
our $VERSION = '0.01';

use Text::Emoticon 0.03;
use base 'Text::Emoticon';
use JSON 2.15 qw(from_json);

sub default_config {
    return {
        imgbase => "http://statics.plurk.com",
        xhtml   => 0,
        strict  => 0,
        class   => undef,
    };
}

{
    local $/ = undef;
    my $emoticons;
    for(map {@$_} values %{from_json(<DATA>)->{karma}}) {
        $emoticons->{$_->[0]} = substr($_->[1], length("http://statics.plurk.com/"));
    }
    __PACKAGE__->register_subclass($emoticons);
}

1;

=head1 NAME

Text::Emoticon::Plurk - Plurk Emoticons

=head1 SYNOPSIS

    my $emoticon = Text::Emoticon->new('Plurk');
    print $emoticon->filter('Hello (banana_rock)');

=head1 AUTHOR

Kang-min Liu  C<< <gugod@gugod.org> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2009, Kang-min Liu C<< <gugod@gugod.org> >>.

This is free software, licensed under:

    The MIT (X11) License

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

=cut

# This data is the response of http://www.plurk.com/API/Emoticons/get?api_key=xxxxxx
__DATA__
{"karma": {"0": [[":-))", "http:\/\/statics.plurk.com\/ff124032f8cc3a9d43b99e661f8fcb4d.gif"], [":-)", "http:\/\/statics.plurk.com\/99ef3957ef779718546752b749bdeabd.gif"], [":-D", "http:\/\/statics.plurk.com\/3385896779bf1c13188bf92ca516878e.gif"], ["(LOL)", "http:\/\/statics.plurk.com\/615f18f7ea8abc608c4c20eaa667883b.gif"], [":-P", "http:\/\/statics.plurk.com\/2d5e21929e752498e36d74096b1965e1.gif"], ["(woot)", "http:\/\/statics.plurk.com\/13b15aa49358be8f47b58552401d7725.gif"], [";-)", "http:\/\/statics.plurk.com\/57c69f50e40a283dcd2e7b56fc191abe.gif"], [":-o", "http:\/\/statics.plurk.com\/8eb05ca7a32301ba16c9496bcad893c4.gif"], ["X-(", "http:\/\/statics.plurk.com\/261c0fe4a88417146ae0292d697a5f52.gif"], [":-(", "http:\/\/statics.plurk.com\/11eed61b41a3e935773476ac33bc00d9.gif"], [":'-(", "http:\/\/statics.plurk.com\/72ddf2c585fe77dd0be731b19624d8cb.gif"], [":-&", "http:\/\/statics.plurk.com\/2884b8d0e496c06136c86e9c9599edae.gif"]], "25": [["(K)", "http:\/\/statics.plurk.com\/9454d15bcaf411b159dcc147ebc3f0eb.gif"], ["(angry)", "http:\/\/statics.plurk.com\/a5ae31c4185bc60cd006650dc10f8147.gif"], ["(annoyed)", "http:\/\/statics.plurk.com\/35b16fc25623670e41c2be6bf8ac38c7.gif"], ["(wave)", "http:\/\/statics.plurk.com\/4afd784c0df9f7a3ceacb92beca543f6.gif"], ["B-)", "http:\/\/statics.plurk.com\/c1c9870cf653fa3cd103d2eb0f519ccb.gif"], ["(cozy)", "http:\/\/statics.plurk.com\/d1a6f08507b126ec6a215e6a2372e8bb.gif"], ["(sick)", "http:\/\/statics.plurk.com\/5495d64ccb898ca596b061168fa0374a.gif"], ["(:", "http:\/\/statics.plurk.com\/b82e3225c92a764d225429a6487d9f04.gif"], ["(goodluck)", "http:\/\/statics.plurk.com\/65271ac2126706bc09d31ff67c525d67.gif"], ["(griltongue)", "http:\/\/statics.plurk.com\/a709dab8ddd26bd222466d31bd549579.png"], ["(s_LOL)", "http:\/\/statics.plurk.com\/615f18f7ea8abc608c4c20eaa667883b.gif"], ["(mmm)", "http:\/\/statics.plurk.com\/e3baa9d0d78c35e955a6b07c39f530fa.gif"], ["(hungry)", "http:\/\/statics.plurk.com\/0f96595ed7733393b93a3d67aa4f2f4f.gif"], ["(music)", "http:\/\/statics.plurk.com\/919b87048fdf7bd59dae457f4284b20b.gif"], ["(tears)", "http:\/\/statics.plurk.com\/96872d481bbfe87aad5aed976c7de4ee.gif"], ["(tongue)", "http:\/\/statics.plurk.com\/56336bb821c4766001816639e55e5811.gif"], ["(unsure)", "http:\/\/statics.plurk.com\/6cb1dc388b9259565efedef8f336d27d.gif"], ["(highfive)", "http:\/\/statics.plurk.com\/a9560787e93f4f8890e4bd38696ba537.gif"], ["(dance)", "http:\/\/statics.plurk.com\/a55bdb344892676b0fea545354654a49.gif"], ["(blush)", "http:\/\/statics.plurk.com\/9939dd585cf0e8d39e7912a98a9ce727.gif"]], "50": [["(doh)", "http:\/\/statics.plurk.com\/e8ed6c7eed76d2acd9dbf469f29fbec2.gif"], ["(brokenheart)", "http:\/\/statics.plurk.com\/2b3593aea68efa7a00b4ef2850f98b8a.gif"], ["(drinking)", "http:\/\/statics.plurk.com\/ed3620ff28a02e3dc9ac4ffa8e6ae2e6.gif"], ["(girlkiss)", "http:\/\/statics.plurk.com\/08a43d50691a1ed22706fc92f568fa07.gif"], ["(rofl)", "http:\/\/statics.plurk.com\/8600839dc03e6275b53fd03a0eba09cf.gif"], ["(money)", "http:\/\/statics.plurk.com\/e6bb16b6ef386c5f23900b103dbdba31.gif"], ["(nottalking)", "http:\/\/statics.plurk.com\/f053074bcce500fbd1e2327d49748a6d.gif"], ["(party)", "http:\/\/statics.plurk.com\/1f44d3984a094fceae1f1a016a730fc9.gif"], ["(sleeping)", "http:\/\/statics.plurk.com\/2f7c90ce56fb4a70e34c04d8d7692dd0.gif"], ["(thinking)", "http:\/\/statics.plurk.com\/900f3dd0adaad9142d567caf6bfb1311.gif"], ["(bringit)", "http:\/\/statics.plurk.com\/95ace5ba1097301b5206a9e0fb431624.gif"], ["(worship)", "http:\/\/statics.plurk.com\/95e69aa508d4bb435706b9db0a610dad.gif"], ["(applause)", "http:\/\/statics.plurk.com\/a08ed27ec14b48d4703f53f7eb94834b.gif"], ["8-)", "http:\/\/statics.plurk.com\/85ef5fa01a6a67a525429f8bf4279fe7.gif"], ["(rock)", "http:\/\/statics.plurk.com\/1c890273544559b17f090d09238fa763.gif"], ["(gym)", "http:\/\/statics.plurk.com\/986ecf2b1ae69072e0195b0a58545900.gif"], ["(heart)", "http:\/\/statics.plurk.com\/150e3f367a063d3baf9720719d78d778.gif"], ["(devil)", "http:\/\/statics.plurk.com\/3fabe74e992888be701de2a9d80c180a.gif"], ["(lmao)", "http:\/\/statics.plurk.com\/92b595a573d25dd5e39a57b5d56d4d03.gif"]], "100": [["(muhaha)", "http:\/\/statics.plurk.com\/84f94a47fcaf1df0a5f17a1cfa52fa64.gif"], ["(taser)", "http:\/\/statics.plurk.com\/44117848701cd748460921cfea5c3781.gif"]], "81": [["(banana_cool)", "http:\/\/statics.plurk.com\/4f01bac8a707e5450307f97065ec0fa7.gif"], ["(banana_rock)", "http:\/\/statics.plurk.com\/48515125401120316abb97666458d05b.gif"], ["(evil_grin)", "http:\/\/statics.plurk.com\/aabbc82c2b0dc72bfbce2f82c97a95e8.gif"], ["(headspin)", "http:\/\/statics.plurk.com\/b0b0596acce9ffc1f2a27548aa642eaf.gif"], ["(heart_beat)", "http:\/\/statics.plurk.com\/52991d7ff65a05526454bd1170a0f14c.gif"], ["(ninja)", "http:\/\/statics.plurk.com\/846277f0a154dc95a08594b7d32a5ccd.gif"], ["(haha)", "http:\/\/statics.plurk.com\/843739a95294fd0bf4c958840b46408f.gif"], ["(evilsmirk)", "http:\/\/statics.plurk.com\/22416dced8b59446db8cd366cc925d09.gif"], ["(eyerolll)", "http:\/\/statics.plurk.com\/e3f0f67ca3af62e34f13abf1d036a010.gif"]]}, "recuited": {"10": [["(bigeyes)", "http:\/\/statics.plurk.com\/8073c1716e75d32eb79f97a9f521fa01.gif"], ["(funkydance)", "http:\/\/statics.plurk.com\/373cd2f23dab7528d4875170d13d64f7.gif"], ["(idiot)", "http:\/\/statics.plurk.com\/8863234ebea13f109c9b15ba19a4531c.gif"], ["(lonely)", "http:\/\/statics.plurk.com\/8738c7a1c402f41b5319abe504ce9687.gif"], ["(scenic)", "http:\/\/statics.plurk.com\/db4c4a7d141fdcaca4d4b11f8fb360db.gif"], ["(hassle)", "http:\/\/statics.plurk.com\/ced6d40bebe2d424b59322b311fc04bb.gif"], ["(panic)", "http:\/\/statics.plurk.com\/b62d1e55e8311af5bc7526c595ac1dbb.gif"], ["(okok)", "http:\/\/statics.plurk.com\/9b6f4864c822e1a97c98507c2b41a74f.gif"], ["(yahoo)", "http:\/\/statics.plurk.com\/e49c8ae965452550c98fc7f99741ae0d.gif"], ["(cry)", "http:\/\/statics.plurk.com\/318416eab5a856bddb1e106a21ff557a.gif"]]}}
