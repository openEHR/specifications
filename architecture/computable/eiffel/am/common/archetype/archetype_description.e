indexing
	component:   "openEHR Common Archetype Model"
	
	description: "[
			 Defines semantics of the lifecycle of an archetype.

			 EXPERIMENTAL. The lifecycle state diagram has not been 
			 defined, and it may be that there will not be one agreed lifecycle.
			 ]"
	keywords:    "archetype"
	
	design:      "openEHR Commmon Archetype Model 0.3"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/common/archetype/SCCS/s.archetype_description.e $"
	revision:    "$Revision: 1.1 $"
	last_change: "$Date: 03/11/14 14:08:05+00:00 $"

class ARCHETYPE_DESCRIPTION

feature -- Access

	purpose: DV_PARAGRAPH	
			-- Description of the archetype.

	use: DV_PARAGRAPH	
			-- Description of the uses of the archetype, i.e. contexts in which it could be used.

	misuse: DV_PARAGRAPH	
			-- Description of any misuses of the archetype, i.e. contexts in which it should not be used.

	classifications: SET [STRING]
			-- keywords describing this archetype; used by C_ARCHETYPE

	submitter: PARTY	
			-- Identification of the organisation submitting this archetype.

	author: PARTY	
			-- Identification of the author of the main content of this archetype.

	approved_by: PARTY	
			-- Identification of the approving organisation of this archetype.

	last_changed: DV_DATE_TIME	
			-- Description of any misuses of the archetype, i.e. contexts in which it should not be used.

	status: DV_STATE	
			-- Lifecycle state of the archetype. Includes at least the states: submitted, 
			-- experimental, awaiting_approval, approved, superseded, obsolete.

invariant
	purpose_exixts: purpose /= Void
	submitter_exists: submitter /= Void
	author_exists: author /= Void
	approved_by_valid: status.value.is_equal("approved") implies approved_by /= Void
	last_changed_exists: last_changed /= Void	

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is archetype_description.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
