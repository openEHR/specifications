<?php
require_once($_SERVER['DOCUMENT_ROOT'].'/templates/_functions.php');

//Change page name here:
$PageName = 'Release 1.0.2';

require_once($_SERVER['DOCUMENT_ROOT'].'/templates/_header_english.php');
?>

		<div id="Content">
<!-- ====================== Content starts here ====================== -->
		
			<h1><?php echo "$PageName";?></h1>
			
			<p><a href="https://openehr.atlassian.net/browse/SPEC/fixforversion/10030/?selectedTab=com.atlassian.jira.plugins.jira-development-integration-plugin:release-report-tabpanel" target="_blank">Release notes</a> </p>

			<!-- =========================================== Overview =========================================== -->
			<h2>Overview</h2>
			<p>This page provides access to the Release 1.0.2 deliverables of the openEHR specification project and indicates the current status (lifecycle state) of each. The lifecycle states are as follows: </p>
			<p>The lifecycle states are as follows: </p>
			<table class="TableBasic">
			<tbody>
			<tr>
				<th> Lifecycle State </th>
				<th> Description </th>
			</tr>
			<tr style="background-color:#FFFCDC;">
				<td> development</td>
				<td> agile development by project group, no formal change management, visibility of documentation and experimental software. By the end of development, an open source reference implementation must be available</td>
			</tr>
			<tr style="background-color:#FFFFCC;">
				<td> trial </td>
				<td> during this period, the specification is managed in a formal way. Issues are reported on an online tracker; changes are recorded on a separate dedicated tracker, ensuring every change to the specification is recorded </td>
			</tr>
			<tr>
				<td> stable </td>
				<td> specifications that have been tested in software and are in use in the community.</td>
			</tr>
			</tbody>
			</table>

			<h2>Reading Documents</h2>
			<p>Most links in the table below are to Adobe PDF files. All files are in colour. If you do not see them in colour or have other problems reading them, we suggest upgrading to the <a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank">latest Acrobat Reader</a>. If you still experience problems with reading PDF files, your browser configuration may need to be adjusted. See the <a href="http://www.adobe.com/support/products/acrreader.html" target="_blank">Adobe Acrobat support page</a> for more help.</p>
			
			<!-- =========================================== Core =========================================== -->
			<h2>Core</h2>
			<table class="TableBasic">
			<tbody>
			<tr>
				<th> Component</th>
				<th> Documentary Specification </th>
				<th> (Original PDF) </th>
				<th> Description </th>
				<th> Status </th>
			</tr>
			<tr>
				<td colspan=5> <b>Requirements</b> </td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> Standards conformance </td>
				<td> </td>
				<td> <a href="/releases/1.0.2/requirements/iso18308_conformance.pdf" target="_blank">ISO 18308 Conformance Statement</a></td>
				<td> Document describing conformance of openEHR architecture to ISO TS 18308, &quot;Requirements for EHR Architectures&quot;. </td>
				<td> stable</td>
			</tr>
			<tr>
				<td colspan=5> <b>Architecture</b> </td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> Architecture <br class="atl-forced-newline" /> </td>
				<td> <a href="/releases/BASE/Release-1.0.2/architecture_overview.html" target="_blank">Architecture Overview</a></td>
				<td> <a href="/releases/1.0.2/architecture/overview.pdf" target="_blank">(PDF)</a></td>
				<td> &quot;Read me first&quot; document for the whole architecture. provides a summary of the reference, archetype and service models, and describes global semantics. </td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> Reference Model</td>
				<td> <a href="/releases/RM/Release-1.0.2/ehr.html" target="_blank">EHR IM</a></td>
				<td> <a href="/releases/1.0.2/architecture/rm/ehr_im.pdf" target="_blank">(PDF)</a></td>
				<td> The information model of the openEHR EHR. </td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/RM/Release-1.0.2/demographic.html" target="_blank">Demographic IM</a></td>
				<td> <a href="/releases/1.0.2/architecture/rm/demographic_im.pdf" target="_blank">(PDF)</a></td>
				<td> The openEHR demographic model. </td>
				<td> stable</td>
			</tr>
			<tr style="background-color:#FFFCDC;">
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/RM/Release-1.0.2/ehr_extract.html" target="_blank">EHR Extract IM</a></td>
				<td> <a href="/releases/1.0.2/architecture/rm/ehr_extract_im.pdf" target="_blank">(PDF)</a></td>
				<td> The information model of the EHR Extract, which is a serilialisation of content from an EHR. </td>
				<td> development</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/RM/Release-1.0.2/common.html" target="_blank">Common IM</a></td>
				<td> <a href="/releases/1.0.2/architecture/rm/common_im.pdf" target="_blank">(PDF)</a></td>
				<td> Information model containing common concepts, including the archetype-enabling LOCATABLE class, party references, audits and attestations, change control, and authored resources. </td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/RM/Release-1.0.2/data_structures.html" target="_blank">Data Structures IM</a></td>
				<td> <a href="/releases/1.0.2/architecture/rm/data_structures_im.pdf" target="_blank">(PDF)</a></td>
				<td> Information model of data structures, incuding a powerful model of HISTORY and EVENT. </td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/RM/Release-1.0.2/data_types.html" target="_blank">Data Types IM</a></td>
				<td> <a href="/releases/1.0.2/architecture/rm/data_types_im.pdf" target="_blank">(PDF)</a></td>
				<td> Information model of data types, including quantities, date/times, plain and coded text, time specification, multimedia and URIs. </td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/RM/Release-1.0.2/support.html" target="_blank">Support IM</a></td>
				<td> <a href="/releases/1.0.2/architecture/rm/support_im.pdf" target="_blank">(PDF)</a></td>
				<td> Support model defining identifiers, assumed types, and terminology interface specification used in the rest of the specifications. </td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/RM/Release-1.0.2/integration.html" target="_blank">Integration IM</a></td>
				<td> <a href="/releases/1.0.2/architecture/rm/integration_im.pdf" target="_blank">(PDF)</a></td>
				<td> Model supporting expression of legacy data in a free form for further processing into and out of openEHR information structures. </td>
				<td> stable</td>
			</tr>
			<tr style="background-color:#FFFCDC;">
				<td style="background-color:#FFFFFF;"> Archetype Model  </td>
				<td> </td>
				<td> <a href="/releases/1.0.2/architecture/am/archetype_system.pdf" target="_blank">Archetype System</a></td>
				<td> Description of system of archetype management and governance. This document will change as a result of current work on archetype ontologies, governance, and logistical management.</td>
				<td> development</td>
			</tr>
			<tr style="background-color:#FFFCDC;">
				<td style="background-color:#FFFFFF;"> &nbsp; </td>
				<td> </td>
				<td> <a href="/releases/1.0.2/architecture/am/archetype_semantics.pdf" target="_blank">Archetype Semantics</a></td>
				<td> Description of semantics of populations of archetypes, including identifiers, specialisation, revision, versioning, composition, and conformance.</td>
				<td> development</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/AM/Release-2.0.6/ADL1.4.html" target="_blank">Archetype Definition Language 1.4 (ADL)</a></td>
				<td> <a href="/releases/1.0.2/architecture/am/adl.pdf" target="_blank">(PDF)</a></td>
				<td> Abstract syntax specification for archetypes 1.4 edition of language (used in ISO 13606-2). </td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> <a href="/releases/AM/Release-2.0.6/AOM1.4.html" target="_blank">Archetype Object Model 1.4 (AOM)</a></td>
				<td> <a href="/releases/1.0.2/architecture/am/aom.pdf" target="_blank">(PDF)</a></td>
				<td> Object model of archetypes corresponding to ADL 1.4. </td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> </td>
				<td> <a href="/releases/1.0.2/architecture/am/openehr_archetype_profile.pdf" target="_blank">openEHR Archetype Profile (OAP)</a></td>
				<td> openEHR plug-in additions to the generic archetype object model.</td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> &nbsp;</td>
				<td> </td>
				<td> <a href="/releases/1.0.2/architecture/am/archetype_principles.pdf" target="_blank">Archetypes Principles</a></td>
				<td> Semantic principles of archetypes and templates.</td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> Terminology </td>
				<td> </td>
				<td> <a href="/releases/1.0.2/architecture/terminology.pdf" target="_blank">openEHR Vocabulary</a> </td>
				<td> Documentary form of the&nbsp;openEHR terminology, which is a set of vocabularies and code sets used by the reference and archetype models. </td>
				<td> stable</td>
			</tr>
			</tbody>
			</table>

			<!-- =========================================== Computable expressions =========================================== -->
			<h3>Computable Expressions</h3>
			<table class="TableBasic">
			<tbody>
			<tr>
				<th> Format </th>
				<th> Details </th>
			</tr>
			<tr>
				<td> UML </td>
				<td> <a href="https://github.com/openEHR/specifications/tree/master/computable/UML">source files (XMI)</a> | <a href="/releases/trunk/UML/">website</a> 
				</td>
			</tr>
			<tr>
				<td> BMM </td>
				<td> <a href="/releases/1.0.2/reference-models/openEHR/BMM/">BMM models</a></td>
			</tr>
			<tr>
				<td> XML </td>
				<td> <a href="/releases/1.0.2/architecture/computable/terminology/terminology.html">openEHR Terminology</a></td>
			</tr>
			</tbody>
			</table>

			
			<!-- =========================================== Non-core =========================================== -->
			<h2>Non-core</h2>
			<table class="TableBasic">
			<tbody>
				<tr>
				<th> Component  </th>
				<th> Documentary Specification  </th>
				<th> Computable / formal expressions  </th>
				<th> Description  </th>
				<td class="TableMainT"> Status</td>
			</tr>
			<tr>
				<td colspan=5> <b>General</b>  </td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> Specification Management </td>
				<td> <a href="/releases/1.0.2/CM/CM_plan.pdf">CM Plan</a> </td>
				<td> &nbsp;</td>
				<td> Technical document describing how versioning, changes, and releases are made. Describes the workflow of the Architectural Review Board (ARB).</td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> Model Management </td>
				<td> <a href="/releases/1.0.2/architecture/modelling_guide.pdf">Modelling Guide</a> </td>
				<td> &nbsp;</td>
				<td> Technical document describing how versioning, changes, and releases are made. Describes the workflow of the Architectural Review Board (ARB).</td>
				<td> stable</td>
			</tr>
			<tr>
				<td colspan=5> <b>Implementation</b>  </td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> XML Schema </td>
				<td> <a href="/releases/1.0.2/its/XML-schema/index.html">XML Schema Homepage</a> </td>
				<td> <a href="/releases/1.0.2/its/XML-schema/index.html">XSDs</a> </td>
				<td> XML-schema expression of the reference model.</td>
				<td> stable</td>
			</tr>
			<tr>
				<td style="background-color:#FFFFFF;"> Java </td>
				<td> <a href="/releases/1.0.2/its/Java/openEHR-JavaITS.pdf">Java Development Guide</a> </td>
				<td> &nbsp; </td>
				<td> Guide to java implementation of openEHR.</td>
				<td> stable</td>
			</tr>
			</tbody>
			</table>
			
			<a href="/programs/specification/historicalreleases">>> Back to Historical Releases</a>

<!-- ------------------------------------------- Content ends here ------------------------------------------------- -->
		</div>	
<?php require_once($_SERVER['DOCUMENT_ROOT'].'/templates/_footer.php');?>
