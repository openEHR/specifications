indexing
	component:   "openEHR Data Types Archetype Model"
	
	description: "[
			 Constrainer type for instances of DV_QUANTITY.
			 ]"
	keywords:    "archetype, quantity"
	
	design:      "openEHR Data Types Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/data_types/quantity/SCCS/s.c_dv_quantity.e $"
	revision:    "$Revision: 1.1 $"
	last_change: "$Date: 03/11/14 14:08:08+00:00 $"

class C_DV_QUANTITY

inherit
	C_DV_QUANTIFIED

create 
	default_create,
	make_dimensioned,
	make_dimensionless,
	make_from_display_string,
	make_from_canonical_string

feature -- Initialization
	
	make_from_display_string(str:STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
		do
		end

	make_dimensioned (a_value: INTERVAL[COMPARABLE]; a_units: C_STRING; a_property: C_DV_CODED_TEXT) is
		do
			c_value := a_value
			c_property := a_property
			c_units := a_units
		ensure
			c_value_set: c_value = a_value
			c_property_set: c_property = a_property
			c_units_set: c_units = a_units
		end

	make_dimensionless (a_value: INTERVAL[COMPARABLE]) is
		do
			c_value := a_value
		ensure
			c_value_set: c_value = a_value
		end

feature -- Access

	c_value: INTERVAL[COMPARABLE]
			-- allowed values of the quantity

	c_units: C_STRING
			-- allowed units; Void means no units allowed; 
			-- "*" means any units allowed

	c_property: C_DV_CODED_TEXT
			-- valid properties
			
	default_value: DV_QUANTITY is
			-- 
		local
			a_numeric: NUMERIC
		do
			if not c_value.lower_unbounded then
				a_numeric ?= c_value.lower
			elseif not c_value.upper_unbounded then
				a_numeric ?= c_value.upper
			else
				a_numeric := 0
			end
			if is_dimensionless then
				create Result.make_dimensionless(a_numeric)
			else
				create Result.make_dimensioned(a_numeric, c_units.default_value, c_property.default_value)
			end
		end

feature -- Status Report

	is_dimensionless: BOOLEAN is
			-- true if this object restricts DV_QUANTITY instances 
		do
			Result := c_units = Void
		end
		
	valid_value (a_value: DV_QUANTITY): BOOLEAN is 
		local
			a_comparable: COMPARABLE
		do
			Result := True
			if c_value /= Void then
				a_comparable ?= a_value.value
				Result := c_value.has(a_comparable)
			end
			if c_units /= Void then
				Result := Result and c_units.valid_value (a_value.units)
			end
			if c_property /= Void then
				Result := Result and c_property.valid_value(a_value.property)
			end
		end

feature -- Output

	as_display_string: STRING is
			-- string form displayable for humans
		do
		end
	
	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
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
--| The Original Code is c_dv_quantity.e.
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
