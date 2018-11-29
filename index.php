<?php
require_once($_SERVER['DOCUMENT_ROOT'].'/templates/_functions.php');

//Change page name here:
$PageName = 'Release 0.9';

require_once($_SERVER['DOCUMENT_ROOT'].'/templates/_header_english.php');
?>

		<div id="Content">
<!-- - ----------------------------------------- Content starts here ------------------------------------------------- -->
		
			<h1><?php echo "$PageName";?></h1>
			
			<h2>Overview</h2>
			<p>The following table provides access to the deliverables of the openEHR specification project and indicates the current status of each. There are three groups of deliverables, as follows: </p>
			<ul>
				<li><em>Stable</em>: specifications that have been tested in software and are in use in the community;</li>
				<li><em>Trial</em>: specifications that have been worked on by a design group and validated in test software to the point where they are ready for community use on a trial basis;</li>
				<li><em>Development</em>: draft forms of specification documents, made available for the purposes of review, input and experimental use.</li>
			</ul>
			<p><a href="/issues/browse/SPEC/fixforversion/10015" target="_blank">Release notes</a> for this release. The rules for change management between releases are given in the <a href="releasestrategy">Release Strategy</a>.</p>

			
			<h2>Reading Documents</h2>
			<p>Most links in the table below are to Adobe PDF files. All files are in colour. If you do not see them in colour or have other problems reading them, we suggest upgrading to the <a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank">latest Acrobat Reader</a>. If you still experience problems with reading PDF files, your browser configuration may need to be adjusted. See the <a href="http://www.adobe.com/support/products/acrreader.html" target="_blank">Adobe Acrobat support page</a> for more help.</p>
			
			
			<h2>Core</h2>
			<table class="TableBasic">
			<tbody>
			<tr>
				<th> Component</th>
				<th> Documentary Specification </th>
				<th> Computable / formal expressions </th>
				<th> Description </th>
				<th> Status </th>
			</tr>
			<tr>
				<td colspan=5> <b>Requirements</b> </td>
			</tr>
			<tr style="background-color:#F3F8FA;">
				<td style="background-color:#FFFFFF;"> Standards conformance </td>
				<td> <a href="/releases/0.9/requirements/iso18308_conformance.pdf" target="_blank">ISO 18308 Conformance Statement</a></td>
				<td> &nbsp;</td>
				<td> Document describing conformance of openEHR architecture to ISO TS 18308, &quot;Requirements for EHR Architectures&quot;. </td>
				<td> stable</td>
			</tr>
			<tr>
				<td colspan=5> <b>Architecture</b> </td>
			</tr>
			<tr style="background-color:#FFEECC;">
				<td style="background-color:#FFFFFF;"> Reference Model</td>
				<td> <a href="/releases/0.9/architecture/rm/ehr_im.pdf" target="_blank">EHR IM</a> </td>
				<td> &nbsp;</td>
				<td> The information model of the openEHR EHR. </td>
				<td> trial</td>
			</tr>
			<tr style="background-color:#FFEECC;">
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/0.9/architecture/rm/demographic_im.pdf" target="_blank">Demographic IM</a> </td>
				<td> &nbsp;</td>
				<td> The openEHR demographic model. </td>
				<td> trial</td>
			</tr>
			<tr style="background-color:#FFFFDD;">
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/0.9/architecture/rm/ehr_extract_im.pdf" target="_blank">EHR Extract IM</a> </td>
				<td> &nbsp;</td>
				<td> The information model of the EHR Extract, which is a serilialisation of content from an EHR. </td>
				<td> development</td>
			</tr>
			<tr style="background-color:#FFEECC;">
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/0.9/architecture/rm/common_im.pdf" target="_blank">Common IM</a> </td>
				<td> &nbsp;</td>
				<td> Information model containing common concepts, including the archetype-enabling LOCATABLE class, party references, audits and attestations, change control, and authored resources. </td>
				<td> trial</td>
			</tr>
			<tr style="background-color:#FFEECC;">
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/0.9/architecture/rm/data_structures_im.pdf" target="_blank">Data Structures IM</a> </td>
				<td> &nbsp;</td>
				<td> Information model of data structures, incuding a powerful model of HISTORY and EVENT. </td>
				<td> trial</td>
			</tr>
			<tr style="background-color:#FFEECC;">
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/0.9/architecture/rm/data_types_im.pdf" target="_blank">Data Types IM</a></td>
				<td> &nbsp;</td>
				<td> Information model of data types, including quantities, date/times, plain and coded text, time specification, multimedia and URIs. </td>
				<td> trial</td>
			</tr>
			<tr style="background-color:#FFEECC;">
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/0.9/architecture/rm/support_im.pdf" target="_blank">Support IM</a> </td>
				<td> &nbsp;</td>
				<td> Support model defining identifiers, assumed types, and terminology interface specification used in the rest of the specifications. </td>
				<td> trial</td>
			</tr>
			<tr style="background-color:#FFFFDD;">
				<td style="background-color:#FFFFFF;"> Archetype Model  </td>
				<td> <a href="/releases/0.9/architecture/am/archetype_system.pdf" target="_blank">Archetype System</a></td>
				<td> &nbsp;</td>
				<td> Description of system of archetype management and governance. This document will change as a result of current work on archetype ontologies, governance, and logistical management.</td>
				<td> development</td>
			</tr>
			<tr style="background-color:#FFFFDD;">
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/0.9/architecture/am/adl.pdf" target="_blank">Archetype Definition Language 1.1 (ADL)</a></td>
				<td> &nbsp;</td>
				<td> Abstract syntax specification for archetypes 1.1 edition of language (used in ISO 13606-2). </td>
				<td> development</td>
			</tr>
			<tr style="background-color:#FFFFDD;">
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/0.9/architecture/am/archetype_principles.pdf" target="_blank">Archetypes Principles</a></td>
				<td> &nbsp;</td>
				<td> Semantic principles of archetypes and templates.</td>
				<td> development</td>
			</tr>
			</tbody>
			</table>
			
			
			<h2>Non-core</h2>
			<table class="TableBasic">
			<tbody>
			<tr style="background-color:#F3F8FA;">
				<th> Component  </th>
				<th> Documentary Specification  </th>
				<th> Computable / formal expressions  </th>
				<th> Description  </th>
				<td class="TableMainT"> Status</td>
			</tr>
			<tr>
				<td colspan=5> <b>General</b>  </td>
			</tr>
			<tr style="background-color:#F3F8FA;">
				<td style="background-color:#FFFFFF;"> Specification Management </td>
				<td> <a href="/releases/0.9/CM/CM_plan.pdf">CM Plan</a> </td>
				<td> &nbsp;</td>
				<td> Technical document describing how versioning, changes, and releases are made. Describes the workflow of the Architectural Review Board (ARB).</td>
				<td> stable</td>
			</tr>
			</tbody>
			</table>
			
			<a href="/programs/specification/historicalreleases">>> Back to Historical Releases</a>

<!-- ------------------------------------------- Content ends here ------------------------------------------------- -->
		</div>	
<?php require_once($_SERVER['DOCUMENT_ROOT'].'/templates/_footer.php');?>
