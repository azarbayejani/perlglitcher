#!/usr/bin/perl



$dir = (split(m%/%, $ARGV[0]))[0];

open(FILE, "<".$ARGV[0]);
binmode(FILE);

$buf = "";
my $start_char = "g";


@letter_array = qw(£ • ø ˚ ≈ ≤ ≥ ∑ π œ Ω ç ¡ ¢ ∞ ¶ ª º 
                  a b c d e f g h i j k l m n o p q r s t u v w x y z
                  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
                );

while( $file_count < 24){

  $file_count++;
  $count = 0;

  open(OUTFILE, ">:raw", $dir."/pic$file_count.jpg") or die "Unable to open: $!";

  read(FILE,$buf,1530,0);
  print OUTFILE $buf;

  while( read(FILE, $buf,3,0 ) ){
    $count++;
    $start_char++;
    $buf =~ s/$letter_array[rand @letter_array]/$letter_array[rand @letter_array]/g;
    print OUTFILE $buf;
  }
  
  close(OUTFILE);
  seek(FILE,0,0);
}


close(FILE);
