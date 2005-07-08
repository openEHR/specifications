indexing
	component:   "openEHR Data Types Archetype Model"

	description: "[
			 Constrainer type for instances of DV_TEXT.
			 ]"
	keywords:    "text, data, archetype"

	design:      "openEHR Data Types Reference Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/data_types/text/SCCS/s.c_dv_text.e $"
	revision:    "$Revision$"
	last_change: "$Date$"

class C_DV_TEXT

inherit
	C_DATA_VALUE

create 
	make, make_from_string, make_from_canonical_string

feature -- Initialization

	make, make_from_string(str:STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
		do
		end

feature -- Access

	c_value: C_STRING
			-- displayable rendition of the item, regardless of its underlying structure

	c_mappings: C_REL_MULTIPLE [C_TERM_MAPPING]
			-- terms mapped to this term

	default_value : DV_TEXT is
		do
			create Result.make(c_value.default_value)
		end
		
feature -- Status Report

	valid_value (a_value: DV_TEXT):BOOLEAN is 
		do
			
		end

feature -- Output

	as_string: STRING is
		do
			create Result.make(0)

		end
	
	as_canonical_string: STRING is
		do
			create Result.make(0)
			Result.append(c_value.as_canonical_string)
--			if mappings /= Void then
--				Result.append("<mappings>")
--				from mappings.start
--				until mappings.off
--				loop Result.append("<item>" + mappings.item.as_canonical_string + "</item>")
--				end
--				Result.append("</mappings>")
--			end
			
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
--| The Original Code is c_dv_text.e.
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
