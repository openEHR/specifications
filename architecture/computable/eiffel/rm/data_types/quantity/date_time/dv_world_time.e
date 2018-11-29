indexing
	component:   "openEHR Data Types"

	description: "[
			 Date/times on the real world timeline, i.e. relative to both a temporal 
			 origin and a geographical location on the planet earth.
			 ]"
	keywords:    "date, time"

	requirements:"ISO 18308 TS V1.0 STR 3.7"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/quantity/date_time/SCCS/s.dv_world_time.e $"
	revision:    "$Revision$"
	last_change: "$Date$"

deferred class DV_WORLD_TIME

inherit
	DV_CUSTOMARY_QUANTITY
		
	DATE_TIME_CONSTANTS
		undefine
			is_equal
		end

feature -- Access

	Min_timezone: DV_DURATION is
		once
			create Result.make_definite(0, 12, 0, 0)
			Result := -Result
		ensure
			Result.as_string.is_equal("-12:00:00")
		end

	Max_timezone: DV_DURATION is
		once
			create Result.make_definite(0, 12, 0, 0)
		ensure
			Result.as_string.is_equal("12:00:00")
		end

	timezone: DV_DURATION	
			-- offset from Universal Coordinated Time, in the range -1200 - +1200 
			-- (note that this can affect the date even if no time is recorded).

feature -- Comparison

	is_strictly_comparable_to (other: like Current): BOOLEAN is
			-- True for all date/time types
		do
			Result := True
		end
		
invariant
	timezone_valid: timezone /= Void and then (timezone >= Min_timezone and timezone <= Max_timezone)

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
--| The Original Code is dv_world_time.e.
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