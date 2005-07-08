#!/applications/perl/bin/perl
#
# $Source: C:/project/openehr/spec-dev/scripts/SCCS/s.makeindex.pl $
# $Date: 04/02/13 01:13:43+10:00 $
# $Revision: 1.4 $
#
# Example usage: makeindex.pl -t "id, date_raised, title, status" *.txt
# Copyright (C) 2003, DSTC Pty Ltd.
#----------------------------------------------------------------

use Getopt::Long;

#----------------------------------------------------------------
# html_break_paras
#
# Wrap the argument in <p></p> tags, adding end/start pairs for
# blank lines

sub html_break_paras {
  my($str) = @_;
  chomp($str);

  $str =~ s/\\n/<br\\>/;
#  if ($str =~ /\\n/) {
#	  $str =~ s/^/<p>/;
#	  $str =~ s/$/<\/p>/;
#	  $str =~ s/\\n/<\/p><p>/;
#  }

  return $str;
}

#----------------------------------------------------------------
# html_escape
#
# Escape special characters in a string so that it can appear
# in HTML PCDATA.

sub html_escape {
  my($str) = @_;

  $str =~ s/\&/\&amp;/g;
  $str =~ s/\</\&lt;/g;
  $str =~ s/\>/\&gt;/g;

  return $str;
}

#----------------------------------------------------------------
# extract_data_from_file
#
# Open given filename and parse all the tag/value pairs from it.
# Returns a reference to the hash containing them.

sub extract_data_from_file {
  my($filename) = @_;

  my %data;

  open(DAT, $filename) || die "Error: could not open file: $filename: $!\n";

  # Read first line

  my $line = <DAT>; # read in first line
  chomp($line); # strip trailing CR (or CR-LF)

  # Process lines until no more lines (i.e. EOF)

  while (defined($line)) {

    if ($line =~ /^(\S+)\s*\:\s*(.*)/) {
      # Line starts with a sequence of non-whitespace characters
      # followed by a colon and then other text -- must be a tag name

      my $tag = $1;
      my $value = $2;
	chomp($tag);
	chomp($value);

      # Build complete value by incorporating any subsequent continuation lines
      # Keep reading until next tag line or EOF

      $line = <DAT>; # read in next line
      chomp($line); # strip trailing CR (or CR-LF)

      while (defined($line) && $line !~ /^(\S+)\s*\:\s*(.*)/) {
		if ($line =~ /^$/) {
			$value .= "\n"; # append LF
		} elsif ($line =~ /^\[/) {
			# Line starts with '[' in column 1: a section line, ignore
		}
		else {
			$value .= ' '; # append single space
			$value .= $line; # append continuation line
		}

		$line = <DAT>; # read in next line
		chomp($line); # strip trailing CR (or CR-LF)
      }

	# - Save tag values
	$data{$tag} = $value;

    } elsif ($line =~ /^\s*$/) {
      # Totally empty line, ignore

      $line = <DAT>; # read in next line
      chomp($line); # strip trailing CR (or CR-LF)

    } elsif ($line =~ /^\[/) {
      # Line starts with '[' in column 1: a section line, ignore

      $line = <DAT>; # read in next line
      chomp($line); # strip trailing CR (or CR-LF)

    } else {
      die "Error: $filename: unexpected format in line: \"$line\"\n";
    }
  }

  return \%data;
}

#----------------------------------------------------------------
# Process command line switches

sub process_arguments {
  my($tags_ref, $files_ref, $output_ref, $page_title_ref, $sep_tag_ref) = @_;

  my $opt_help;
  my $tags_str;

  $Getopt::Long::ignorecase = 0;
  local($result) = GetOptions ("help" => \$opt_help,
			       "output=s" => $output_ref,
			       "title=s" => $page_title_ref,
			       "tags=s" => \$tags_str,
			       "separate=s" => $sep_tag_ref,
			      );
  if (! $result) {
    die "$prog: Usage error: --help for help\n";
  }

  if ($opt_help) {
    $opt_help = 1; # to shutup warnings when run with perl -w option
    print "Usage: $0 [options] {files}\n";
    print "Options:\n";
    print "  --help             display this help message\n";
    print "  --tags taglist     list of tags (comma separated list)\n";
    print "  --separate tag     tag to separate on\n";
    print "  --title \"page title\"   title of page (default \"$$page_title_ref\")\n";
    print "  --output filename  file to write HTML to\n";
    exit(0);
  }

  if (defined($tags_str)) {
    @$tags_ref = split(/\s*\,\s*/, $tags_str);
  } else {
    die "Error: no tags to display: use --tags option (see --help)\n";
  }

  # Remaining arguments are names of files to process

  if (scalar(@ARGV) == 0) {
    die "Error: no files to process\n";
  }
  @$files_ref = @ARGV;
}

#----------------------------------------------------------------
# print page header

sub print_header {
	my ($page_title) = @_;
	# Output headings

	# If you screw around with the HTML, validate it using:
	# http://validator.w3.org/

print <<ENDHEADER;
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>

<!DOCTYPE html PUBLIC
 "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en-au" xml:lang="en-au">

<head>
<title>$page_title</title>

<style type="text/css">
body {
  background-color: white;
  color: black;
}
table {
  border: thin solid black;
  border-collapse: collapse;
}
td {
  border: thin solid black;
  padding: 0.5ex 0.25em;
}
td.no-value {
  background-color: red;
}
th { background-color: #ccf; }
</style>

</head>

<body>
<h1>$page_title</h1>
ENDHEADER
}

#------------------------------------
# print table of items for which $tag mtches $sep_tag

sub print_table {
  my ($crs_ref, $tags_ref, $sep_tag, $sep_tag_val) = @_;

  if (defined($sep_tag)) {
	  print "<h2>$sep_tag: $sep_tag_val</h2>\n";
  }

  print "<table>\n";
  print "<tr>\n";
  foreach my $tag (@$tags_ref) {
    if (!defined($sep_tag) || "$sep_tag" ne "$tag") {
	    print "  <th>", html_escape($tag), "</th>\n";
    }
  }
  print "</tr>\n";
  print "\n";

  foreach my $key (sort keys %$crs_ref) {
    my $data_ref = %$crs_ref->{$key};
    if (!defined($sep_tag) || ($data_ref->{$sep_tag} eq $sep_tag_val)) {
	  my $done_link;
	  foreach my $tag (@$tags_ref) {
	      if (!defined($sep_tag) || "$sep_tag" ne "$tag") {
			if (exists $data_ref->{$tag}) {
				print "  <td class='has-value'>";
				if (!defined($done_link)) {
					print "<a href=\"", $data_ref->{"_file"}, "\">";
				}
				print html_break_paras(html_escape($data_ref->{$tag}));
				if (!defined($done_link)) {
					print "</a>";
				}
				print "</td>\n";
			} else {
				print "  <td class='no-value'>---</td>\n";
			}
		}
		$done_link = 1;
	  }
	  print "</tr>\n";
	  print "\n";
    }
  }

  # Output table footer
  print "</table>\n\n";
  print "<br/>";
}

#----------------------------------------------------------------
# print foot of page
sub print_footer {
  print "</body>\n\n";
  print "</html>\n\n";
}


#----------------------------------------------------------------

sub main {
  my @tags = ("id", "date_raised");
  my @file_names = ("CR-000020.txt");
  my $output_file; # undefined means stdout
  my $page_title = "Summary";
  my $sep_tag;


  process_arguments(\@tags, \@file_names, \$output_file, \$page_title, \$sep_tag);

  # make sure sep_tag is in tag list
  my $found;
  if (defined($sep_tag)) {
	  foreach my $tag (@tags) {
		if ("$sep_tag" eq "$tag") {
			$found = 1;
		}
	  }
	  $found || die "Error: sort tag \"$sep_tag\" not in tags list\n";
  }

  # Redirect output (if necessary)
  if (defined($output_file)) {
      open(STDOUT, ">$output_file") || 
      die "Error: could not output to $output_file: $!\n";
  }

  # Output headings
  print_header($page_title);

  # Process each file and put into a hash for sorting
  my %crs;
  my %sep_tag_vals;
  foreach my $filename (@file_names) {
    my $cr = extract_data_from_file($filename);
    $cr->{"_file"} = $filename;

    $crs{$cr->{"id"}} = $cr;
    if (defined($sep_tag)) {
	    $sep_tag_vals{$cr->{$sep_tag}} = "x";
    }
  }

  if (defined($sep_tag)) {
	  foreach my $key (sort keys %sep_tag_vals) {
		  print_table(\%crs, \@tags, $sep_tag, $key);
	  }
  }
  else {
	  print_table(\%crs, \@tags, , );
  }

  print_footer;
}

#----------------------------------------------------------------

exit main();

#----------------------------------------------------------------
#EOF

