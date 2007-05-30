   #!/usr/bin/perl -w

   use strict;

   package HTMLStrip;
   use base "HTML::Parser";
   
   my $importance = 1;
   my $number = 0;
   sub text {
       my ($self, $text) = @_;
       
       while ( $text =~ /([A-Z][a-zA-Z]+)[\s\.,]/g ) {
        $number++;
        print $1 . ';' . $importance . ';' . $number . "\n";
       };

   }
   
   sub start
{
my($self, $tag, $attr, $attrseq, $origtext) = @_;
# $attr is reference to a HASH, $attrseq is reference
			if ( $tag eq "b" ) {
        $importance = 2
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