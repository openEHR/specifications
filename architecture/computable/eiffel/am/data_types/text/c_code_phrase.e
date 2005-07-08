indexing
	component:   "openEHR Data Types Archetype Model"

	description: "[
			 Constrainer for instances of CODE_PHRASE. Constraints can be expressed
			 in two ways:
			 	1) as a terminology_id and optional list of codes from that terminology
			 	2) as an parsable query to an external knowledge resource
			 The first form is expressed by the c_terminology_id and c_code_string attributes.
			 
			 The second is expressed by syntax in the query attribute; example syntax is:
				* has-relation <“is-a” [11111]> <“some term” [22222]>
				* has-category “some category”
				* has-relation <“is-a”[11111]> <“some concept” [22222;3333]> OR 
					(has-relation <“is-a” [11111]> <“some concept” [4444;5555]> AND 
					has-category “some category”)
			 ]"
	keywords:    "text, data, archetype"

	requirements:"ISO 18308 TS V1.0 STR 4.2"
	design:      "openEHR Data Types Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/data_types/text/SCCS/s.c_code_phrase.e $"
	revision:    "$Revision$"
	last_change: "$Date$"

class C_CODE_PHRASE

create 
	make, make_from_string, make_from_canonical_string

feature -- Initialization

	make, make_from_string(a_key: STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
		do
		end

feature -- Status Report

	valid_value (a_value: CODE_PHRASE):BOOLEAN is 
		do
			
		end

feature -- Access

	c_terminology_id: TERMINOLOGY_ID
		
	c_code_string: DV_PARSABLE
	
	query: DV_PARSABLE
	
	default_value: CODE_PHRASE is
			-- 
		do
			
		end

feature -- Output

	as_string: STRING is
			-- string form displayable for humans 
		do
			create Result.make(0)
		end
	
	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			Result := "<c_terminology_id>" + c_terminology_id.as_canonical_string + "</c_terminology_id>" +
				"<c_code_string>" + c_code_string.as_canonical_string + "</c_code_string>"
				-- + "<group_name>" + group_name.as_canonical_string + "</group_name>"
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
--| The Original Code is c_coordinated_term.e.
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
