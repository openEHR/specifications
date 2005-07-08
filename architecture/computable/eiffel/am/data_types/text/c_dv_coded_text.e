indexing
	component:   "openEHR Data Types Archetype Model"

	description: "[
			 Constrainer for instances of DV_CODED_TEXT.
			 ]"
	keywords:    "term, text"

	design:      "openEHR Data Types Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/data_types/text/SCCS/s.c_dv_coded_text.e $"
	revision:    "$Revision: 1.2 $"
	last_change: "$Date: 04/04/06 23:56:29+10:00 $"

class C_DV_CODED_TEXT
    
inherit
	C_DV_TEXT
		rename
			make as make_text
		redefine
			default_create, as_canonical_string, as_string, 
			make_from_canonical_string, make_from_string, valid_value, default_value
		end

create 
	default_create,
	make, make_from_string, make_from_canonical_string

feature -- Initialization

	default_create is
		do
		end

	make (a_value: C_STRING; a_definition: C_CODE_PHRASE) is
		require
			String_valid: a_value /= void
			Definition_valid: a_definition /= Void
		do
			c_value := a_value
			c_definition := a_definition
		ensure
			Value_set: c_value = a_value
			C_definition_set: c_definition = a_definition
		end

	make_from_string(str:STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
		do
		end

feature -- Access

	c_definition: C_CODE_PHRASE
			-- the (possibly coordinated) term from a terminology service whose rubric is the 'value' attribute

	default_value: DV_CODED_TEXT is
			-- 
		do
			
		end
		
feature -- Status Report

	valid_value (a_value: DV_CODED_TEXT): BOOLEAN is 
		do
		end

feature -- Output

	as_string: STRING is
			-- Result in same form as `value'
		do
			Result := precursor
			Result.append (c_definition.as_string)
		end

	as_canonical_string: STRING is
			-- Result in canonical form
		do
			Result := precursor 
			Result.append("<c_definition>" + c_definition.as_canonical_string + "</c_definition>")
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
--| The Original Code is c_dv_coded_text.e.
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
