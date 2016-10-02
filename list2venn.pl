#!/usr/bin/env perl

=encoding utf8

=head2 Description

  list2venn.pl - Convert list of genelist to venn diagrams

=head2 Usage

 perl list2venn.pl list_file.txt 
 R --no-save < list_file.R

=head2 list file format (tsv)

 list        | genelist file 
 ------------|------------------------------------------------
 up_E2       | geneset.DUTERTRE_ESTRADIOL_RESPONSE_24HR_UP.txt
 down_E2     | geneset.DUTERTRE_ESTRADIOL_RESPONSE_24HR_DN.txt
 E2F_targets | geneset.HALLMARK_E2F_TARGETS.txt

=head3 Output

  R script that generate venn diagrams 
  
=head2 Notes

 Require gplots, Vennerable and UpSetR packages:

  * https://cran.r-project.org/web/packages/gplots
  * https://github.com/js229/Vennerable
  * https://cran.r-project.org/web/packages/UpSetR/index.html

=cut

use strict;
use warnings;
use Pod::Usage;

## check parameters
my($file) = @ARGV;
die "must provide a list of list as 1st parameter...\n" unless $file;

my $cmd_line = join(" ","list2venn.pl", @ARGV);

## gene names to skip
my %na = ( "na" => 1, "NA" => 1,  "#N/A" => 1,  "---" => 1,  "--" => 1,  "-" => 1,  " " => 1);

## read lists of genes
my %list_data;
open(F,"<",$file) or die "could not read list of list $file: $!\n";
while(my $line = <F>){
	chomp($line);
	my ($name,$list) = split(/\t/,$line);
	if(not(defined($name))){ next;}
	if(not(defined($list))){ next;}
	$name =~ s/ /_/g;
	print STDERR "reading $name --> $list \n";
	open(L,"<",$list) or die "could not read list $list: $!\n";
	my @clist ;
	while (my $line= <L>){
		chomp($line);
		# skipp na genes
		if(not(defined($line))) {next;}
		if($line eq "") {next;}
		if($na{$line}) {next;}
		push(@clist,$line);
	}
	# rm duplicates
	 my %seen = ();
	 my @unique = grep { ! $seen{ $_ }++ } @clist;
	$list_data{$name} = join("::",@unique);
	close(L);
}
close(F);

## format lists for Vennerable
# R list
my $gene_lists = "";
foreach my $name  (sort keys %list_data){
  $gene_lists .= $name."=c(\"".join("\",\"",split(/::/,$list_data{$name}))."\")\n";
}

## format list for gplots
#         list1 list2
# gene1  0      1
# gene2  1      1
my %list_item; # eg. genes in all list
my %list_has_item; # eg. name::gene
foreach my $name  (sort keys %list_data){
	foreach my $item ( split(/::/,$list_data{$name}) ){
	  $list_has_item{$name."::".$item} = 1;
	  $list_item{$item} = 1;
	 }
}

my $gplot_file = $file;
$gplot_file =~ s/.txt//g;
$gplot_file .= ".gplot";

open(VG,">",$gplot_file) or die "could not create gplot data file... \n";
print VG join("\t","gene",sort keys(%list_data)),"\n";
foreach my $item (keys %list_item ){
	my @line;
	push(@line,$item);
         foreach my $name  (sort keys %list_data){
			
			if(defined($list_has_item{$name."::".$item})){ push(@line,"1"); }
			else{push(@line,"0"); }
				
		}
		print VG join("\t",@line)."\n";
}
 

close(VG);

## name to use for the lists in R
my $names = join(",",sort keys(%list_data) );
my $catnames = "\"".join("\",\"",sort keys(%list_data) )."\"";

my $list_count = keys %list_data;
die "can only generate venn diagram for 2-9 lists (# list : $list_count) ... \n" unless $list_count >= 2 and $list_count <= 9;

## generate R script
my $R_script = $file;
$R_script =~ s/.txt//g;
$R_script .= ".R";

open(R,">",$R_script) or die "could NOT create R script \"$R_script\": $! \n";
print R <<END_R;
# $cmd_line

require("gplots") 
require("Vennerable") 
require("UpSetR")

par(ps=10)

## lists

$gene_lists

x = list(
  $names
 )

category = c($catnames)

if(length(category) < 2){
  stop( "need at least 2 lists...")
}

##########################################
#  gplots : max 5
#  https://cran.r-project.org/web/packages/gplots

d = read.table(file="$gplot_file",row.names=1,sep="\t",header=TRUE)

if(length(category) <= 5){

  try({ 
    venn(d) 
  },silent=TRUE)

}else{ print("skipping gplots (> 5 lists) ...")}

###########################################
#  Vennerable :  max 9
# https://github.com/js229/Vennerable
 
if(length(category) <= 9){

  w <- Venn(Sets=x,SetNames=c($catnames) )
  # param:  type = "circles" , "squares", "ellipses", "triangles" , "AWFE"  or  "ChowRuskey"

 
  try({ plot(w, doWeights = FALSE) },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "circles") },silent=TRUE)
  try({ plot(w, doWeights = FALSE,type = "circles") },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "squares") },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "ellipses")},silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "triangles") },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "AWFE") },silent=TRUE)
  try({ plot(w, doWeights = TRUE,type = "ChowRuskey") },silent=TRUE)
  
 }else{ print("skipping Vennerable (> 9 lists) ...")}

##########################################
# UpSetR : A More Scalable Alternative to Venn and Euler Diagrams for Visualizing Intersecting Sets
# https://cran.r-project.org/web/packages/UpSetR/index.html
  
  upset(d, sets.bar.color = "#56B4E9",nsets = length(category), order.by = "freq", empty.intersections = "off", show.numbers = T )
  
 
##########################################
# heatmap

# par(ps=13)
# corgene = cor(x=d,y=NULL, use = "complete.obs",method = c("pearson"))
# nrcol <- 24
# heatmap.2(corgene,revC=TRUE, margins =c(12,9),cellnote = format(round(corgene, digits=2), nsmall = 2),notecol="darkgray", col =  rev(colorRampPalette(brewer.pal(10, "RdBu"))(nrcol)), scale="none",  key=TRUE, symkey=FALSE, density.info="none", trace="none", cexRow=0.70,cexCol=0.70, tracecol = "black", dendrogram=c("row"), main="heatmap pearson correlation" )
# heatmap.2(corgene,revC=TRUE, margins =c(12,9),cellnote = format(round(corgene, digits=2), nsmall = 2),notecol="black", col=topo.colors(nrcol), scale="none",  key=TRUE, symkey=FALSE, density.info="none",trace="none", tracecol="black", dendrogram=c("row"),cexRow=0.70,cexCol=0.70, main="heatmap pearson correlation")

# q(status = 1)

END_R

close(R);

print STDOUT "\n#Run:\nR --no-save < $R_script \n";
exit(0);

=head2 Authors

David Laperriere dlaperriere@outlook.com

=cut
