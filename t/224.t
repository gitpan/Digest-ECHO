use strict;
use warnings;
use Test::More tests => 68;
use Digest::ECHO qw(echo_224 echo_224_hex);

my $len = 0;

while (my $line = <DATA>) {
    chomp $line;
    my ($msg, $digest) = split '\|', $line, 2;
    my $data = pack 'H*', $msg;
    $digest = lc $digest;

    if ($len and not $len % 8) {
        my $md = Digest::ECHO->new(224)->add($data)->hexdigest;
        is($md, $digest, "new/add/hexdigest: $len bits of $msg");
        is(
            echo_224_hex($data), $digest,
            "echo_224_hex: $len bits of $msg"
        );
        ok(
            echo_224($data) eq pack('H*', $digest),
            "echo_224: $len bits of $msg"
        );
    }

    my $md = Digest::ECHO->new(224)->add_bits($data, $len)->hexdigest;
    is($md, $digest, "new/add_bits/hexdigest: $len bits of $msg");
}
continue { $len++ }

__DATA__
00|17DA087595166F733FFF7CDB0BCA6438F303D0E00C48B5E7A3075905
00|41D84BEDB8E7D3E0AC01BFF8688CED8092F95037A27A7EA236DC3EA7
C0|79AB069EE744845F014C63C7D2F37E38AB8AC8403A14338605A395BB
C0|1BFF9E53DA1939590897C0668DBB5D7DEEC216DC452C638C2D0322C5
80|536E5C3E5DFD5CA086AE9C89C592A80ABFF8EE10AAE1F3D395A30F43
48|B201F10B4B7F14AF94434814643D66705BD288D777B3C3D453F450EB
50|60D10756EB1D3FE057548A7848B09119CDD54DEF057711D5DB923016
98|F9B068E6A4C10C7B4865E452E6993C6BA41E087171944DC95FF8FC3C
CC|34D81C434B63C8FBCF023B6417AF87D906942EBD7B56C1D7B08BADDC
9800|E00E031433F6EDBAD998A3BD64F5AE6CCEACE85C8C9C476B74071C6A
9D40|53B70FF8140AA40D468041FCED4A1D8DF726131369ACD2C96814199A
AA80|E237660873406C5D7561CF8E08F045456FF4853A5A18BCC5D2C02DCE
9830|E71FFEBED1BDC0EC9AD56F3AAD17532768E0B73C37B307515AC7C1C5
5030|0E3ADD533071B0842EE69475F4DD6D6F74388888B90E91654D653AD5
4D24|B1D683F6CB6FDFE0698352B85B2EFF5DBE73BB041261C907EB885F3A
CBDE|7FA614453038985DD9632A53376B11208ED7DEFBDDDADCF820E39309
41FB|63F315E0CC161AA98749D9783866EC2C2BF70CD033431E97EB8C6963
4FF400|68817B73415A390C240AE52F874D411EFA27BFF5E396A663BF903B6F
FD0440|3C0A0C45B24AB028AAE36588C8A359306269D76ED8A9B0AD56D037F1
424D00|8AEE3F72A6201122E531E172D68A25EF23D28E1C622F46A47F738243
3FDEE0|E23DD6EA178C652FCF41B318F29962D374F63E963FAE3355154EF674
335768|5CB9D07CBBE114F32631E3F0DC40FA78A3A23E53ECE725DE561D57C7
051E7C|9D6D79620265CB375375ABFAE2781D83779BAD822B3BC7F293882A00
717F8C|2D7787B27C8329230174BC0A5F36028F18BE22331330852AAA790112
1F877C|ED7A2952CBC3068C58FF4C870AB850AFA0A499FE64FB2E943655AB88
EB35CF80|7059B889ED4D4429743A97E07FBBF0D3625D1D99DC2DCF92BD7BAF09
B406C480|1657DD5EA1515E2E1FC674EEABEEFD2CA2D49852B39F36AC7DFF6B20
CEE88040|A11DE9445FD344703ABE2C0D9C2B137AC97C2ED1656A14064F43F0D9
C584DB70|4F744B5D61418FC7FA11388C07E4D1AEF9023FB6714F4329BAB7F078
53587BC8|ED4A82D019377FAEB5F3354D2475A751990E7CE30EF63950EB064FE8
69A305B0|C191351BEA1D731743C2E8905B436763C3796CAF6242D64A6B757EAC
C9375ECE|29602F8EC501AD8B1F7B66A0EC59A3BF68109BACBC79F94EB1B98AAF
C1ECFDFC|6ED24B67EC06A8F6E9B4D707244E3F61859C855C9FA17B1B60792B8F
8D73E8A280|DFB7E0AD06D3530BDBAB8A296FF8BC7BAD16C638F73636D5944D83C0
06F2522080|35A03552076513C774F80DB23C47E6A4B73EA81203A0DDBB68FF9AA9
3EF6C36F20|2DDEA554962FAE7A6C11C743646C4AA5FA402AEDD8094E6EE265686F
0127A1D340|BA40EBD07634A8DCAECB403ADBB618E66F27BF1B1BEBBDFA19201FC3
6A6AB6C210|3640941317B8EBFD37493060BC5B4676B6425911F76C25F5225F08AF
AF3175E160|31484DD66DCDB8913BAB2FC7EA41A7E375C4B92EE935F0554C9F9D73
B66609ED86|490805350EAA6A18A587F3ABCE1214C9BD31A28D91E2809B79FC47D5
21F134AC57|5BC9AED703B41BB3834F6EC3902DDD93C2F4F6F6A2DFC7CF6BE68138
3DC2AADFFC80|3CED9D77465D53879B9169CCAB897B23DC3E5F0FEE1F3DC04352CE31
9202736D2240|4F41B318B346E2EE553336AB49890C8D09F122F8522C31B6881E36F6
F219BD629820|B38079E4F0A446B02E5792B5E4CCC91DC700CBC31814F3F32235CC76
F3511EE2C4B0|C954A08C0C4F0B5F4F5C1CCAF4E7EB00677051C22194DBF28AE865FD
3ECAB6BF7720|1626E801AB7F763B316A7D7D304E82D3FDE343A87142934E9707E3B8
CD62F688F498|3D19E3CE9E90E4CDA20A9D8A0DA4B945367EFE7F5EECDA637A8292C5
C2CBAA33A9F8|FC786598CDB7F9DECB7B92EEDF8B9FDCC57B73731C73A915CF1B8543
C6F50BB74E29|9D1828002B45002D0229842F23B707C4C5495851172DDC31586A9C5B
79F1B4CCC62A00|4FE9BBF4D75FA3B90F05E0EA13DA7F773B0B0B55A92EA4AF08D1135B
