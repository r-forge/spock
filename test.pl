   #!/usr/bin/perl -w

   use strict;

   package HTMLStrip;
   use base "HTML::Parser";
   
   my $importance = 1;
   my $number = 0;
   sub text {
       my ($self, $text, $tag) = @_;
       
       while ( $text =~ /([A-Z][a-zA-Z]+)[\s\.,]/g ) {
        $number++;
        print $1 . ';' . $tag . ';' . $importance . ';' . $number . "\n";
       };

   }
   
   sub start
{
my($self, $tag, $attr, $attrseq, $origtext) = @_;
# $attr is reference to a HASH, $attrseq is reference
	if ( $tag eq "b" ) {
        $importance = 2
        }
        if ( $tag eq "k" ) {
        $importance = 2
        }
        if ( $tag eq "h1" ) {
        $importance = 3
        }
	if ( $tag eq "h2" ) {
        $importance = 4
        }
        if ( $tag eq "h3" ) {
        $importance = 5
        }
	if ( $tag eq "h4" ) {
        $importance = 6
        }
        if ( $tag eq "h5" ) {
        $importance = 7
        }
	if ( $tag eq "h6" ) {
        $importance = 8
        }
        if ( $tag eq "u" ) {
        $importance = 9
        }
}


sub end
{
 my($self, $tag, $origtext) = @_;
 $importance = 1
}



   my $p = new HTMLStrip;
   # parse line-by-line, rather than the whole

   while (<>) {
       $p->parse($_);
   }
   # flush and parse remaining unparsed HTML
   $p->eof;