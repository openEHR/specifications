#!/bin/bash
# 
# $Source: C:/project/openehr/spec-dev/scripts/SCCS/s.report_cr_pr.sh $
# $Revision: 1.7 $	$Date: 04/02/13 01:13:43+10:00 $
# simple script to run invoke Perl to generate HTML summary file for 
# CRs and PRs
#

PATH=$OPENEHR/$OPENEHR_SPEC/scripts:$PATH


# ------------- functions -------------

bk_edit_pub_files () {
	echo "-----checking out PR publishing area files in $OPENEHR/$OPENEHR_SPEC/publishing/CM/PRs --------"
	cd $OPENEHR/$OPENEHR_SPEC/publishing/CM/PRs
	bk edit -q

	echo "-----checking out CR publishing area files in $OPENEHR/$OPENEHR_SPEC/publishing/CM/CRs --------"
	cd $OPENEHR/$OPENEHR_SPEC/publishing/CM/CRs
	bk edit -q
}

report_by_status() {
	pr_summary_file=$1
	cr_summary_file=$2
	cd $OPENEHR/$OPENEHR_SPEC/CM/PRs
	bk edit -q $pr_summary_file
	echo "-----Building $OPENEHR/$OPENEHR_SPEC/CM/PRs/$pr_summary_file --------"
	perl -S makeindex.pl --tags id,date_raised,title,status --separate status --output $pr_summary_file --title "openEHR PRs by Status" PR*.txt

	echo "-----Building $OPENEHR/$OPENEHR_SPEC/CM/CRs/$cr_summary_file --------"
	cd $OPENEHR/$OPENEHR_SPEC/CM/CRs
	bk edit -q $cr_summary_file
	perl -S makeindex.pl --tags id,date_raised,title,status,target_release,changed_components --separate status --output $cr_summary_file --title "openEHR CRs by Status" CR*.txt
}

report_by_release() {
	cr_summary_file=$1

	echo "-----Building $OPENEHR/$OPENEHR_SPEC/CM/CRs/$cr_summary_file --------"
	cd $OPENEHR/$OPENEHR_SPEC/CM/CRs
	bk edit -q $cr_summary_file
	perl -S makeindex.pl --tags id,title,status,target_release,changed_components --separate target_release --output $cr_summary_file --title "openEHR CRs by Release" CR*.txt
}

copy_files() {
	cd $OPENEHR/$OPENEHR_SPEC/CM/PRs
	cp *.txt *.html $OPENEHR/$OPENEHR_SPEC/publishing/CM/PRs

	cd $OPENEHR/$OPENEHR_SPEC/CM/CRs
	cp *.txt *.html $OPENEHR/$OPENEHR_SPEC/publishing/CM/CRs
}

# ---------- deal with cmd line -------
if [ -z $1 ] 
then
  echo "Usage: `basename $0` by_status | by_release"
  exit 2
fi  

case $1 in
    "by_status" ) echo "Generating CR & PR report grouped by status"
		bk_edit_pub_files
		report_by_status "PR_by_status.html" "CR_by_status.html"
		copy_files
    		;;

    "by_release" ) echo "Generating CR & PR report grouped by release"
		bk_edit_pub_files
		report_by_release "CR_by_release.html"
		copy_files
    		;;

    *     ) echo "Unimplemented option chosen."
    		exit 2
    		;;

esac


