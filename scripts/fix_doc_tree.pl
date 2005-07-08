#!/usr/bin/perl
#
# $Source: C:/project/openehr/spec-dev/scripts/SCCS/s.fix_doc_tree.pl $
# $Date: 04/04/08 00:20:49+10:00 $
# $Revision: 1.1 $
#
# Simple script to remove unwanted lines from ISE-generated HTML files
#
# Copyright (C) 2004, Ocean Informatics Pty Ltd
#
#----------------------------------------------------------------

sub main {
  my $root_dir = "$ENV{OPENEHR}/spec-0.9_D/publishing/architecture/reference_model/computable";

  chdir "$root_dir" || die "could not cd to $root_dir does not exist";


  # get a list of directories to go into
  my @html_file_list = `find . -name "*short.html" -print`;

  # remove unwanted lines left in HTML files
  my @remove_index_tags = ("author", "support", "file", "license", "requirements", "design", "component");
  foreach $html_file (@html_file_list) {
  	chomp $html_file;
  	print "Removing unwanted tags from file $html_file\n";
	my $out_file = "$html_file.tmp";
	if (-f "$html_file") {
		open (HTML_FILE, "< $html_file") || die "could not open $html_file: $!";
		open (OUT_FILE, "> $out_file") || die "could not create $out_file: $!";
		while (defined ($src_line = <HTML_FILE>)) {
			my $pat_found = 0;
			foreach $pat (@remove_index_tags) {
				$pat1 = ">$pat<";
				$pat2 = "=\\\"$pat\\\"";
				if ($src_line =~ /$pat1/ || $src_line =~ /$pat2/) {
					$pat_found = 1;
					next;
				}
			}
			if (! $pat_found) {
				print OUT_FILE "$src_line";
			}
		}
		close (HTML_FILE);
		close (OUT_FILE);
		my $cmd = "mv $out_file $html_file";
		system($cmd) == 0 or die "system $cmd failed: $?";
	} else {
		print "Could not open $html_file\n";
	}
  }

  # remove unwanted feature groups 
  my @remove_feature_groups = ("feature<.*--.*Initiali[sz]ation", ">feature<[^-]*--.*Conversion", ">create<");
  foreach $html_file (@html_file_list) {
  	chomp $html_file;
  	print "Removing unwanted feature sections from file $html_file\n";
	my $out_file = "$html_file.tmp";
	if (-f "$html_file") {
		open (HTML_FILE, "< $html_file") || die "could not open $html_file: $!";
		open (OUT_FILE, "> $out_file") || die "could not create $out_file: $!";
		my $in_remove_section;
		while (defined ($src_line = <HTML_FILE>)) {
			if ($in_remove_section && ($src_line =~ />feature</ || $src_line =~ />invariant</)) {
				$in_remove_section = 0;
			}
			if (! $in_remove_section) {
				foreach $pat (@remove_feature_groups) {
					if ($src_line =~ /$pat/i) {
						$in_remove_section = 1;
						next;
					}
				}
			}
			if (! $in_remove_section) {
				# remove erroneous <""> pattern while we're at it
				$src_line =~ s/\"<\"//g;

				print OUT_FILE "$src_line";
			}
		}
		close (HTML_FILE);
		close (OUT_FILE);
		my $cmd = "mv $out_file $html_file";
		system($cmd) == 0 or die "system $cmd failed: $?";
	} else {
		print "Could not open $html_file\n";
	}
  }
}

#----------------------------------------------------------------

exit main();

#----------------------------------------------------------------
#EOF

