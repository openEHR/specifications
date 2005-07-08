indexing
	component:   "openEHR Data Types"

	description: "Constraint mapping of a term to a text item."
	keywords:    "term, text"

	requirements:"ISO 18308 TS V1.0 STR 4.5"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/data_types/text/SCCS/s.c_term_mapping.e $"
	revision:    "$Revision$"
	last_change: "$Date$"


class C_TERM_MAPPING

inherit
	MATCH_CODES
		export
			{NONE} all;
			{ANY} is_valid_match_code
		end
	
create 
	make

feature -- Initialization

	make(a_term: C_CODE_PHRASE; a_match: LINKED_SET[INTEGER]; a_purpose: C_STRING) is
			-- 
		do
			c_target := a_term
			c_match := a_match
			c_purpose := a_purpose			
		ensure
			Target_set: c_target = a_term
			Match_set: c_match = a_match
			Purpose_set: c_purpose = a_purpose
		end

feature -- Access

	c_target: C_CODE_PHRASE
	
	c_match: SET[INTEGER]

	c_purpose: C_STRING

feature -- Output

	as_display_string: STRING is
			-- Result in form "-> <target> (<match>; <purpose>)
		do
		end

	as_canonical_string: STRING is
			-- Result in canonical form
		do
		end

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
--| The Original Code is c_term_mapping.e.
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
