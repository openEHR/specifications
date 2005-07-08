indexing
	component:   "openEHR Data Types Archetype Model"

	description: "Test C_HISTORY"
	keywords:    "test, C_HISTORY"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"
	
	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/test/am/data_structures/history/SCCS/s.tc_c_history.e $"
	revision:    "$Revision$"
	last_change: "$Date$"

class TC_C_HISTORY

inherit
	TEST_CASE
		redefine 
			check_result
		end

creation
	make

feature -- Access

	title: STRING is "C_HISTORY"

	prereqs: ARRAY[STRING] is
		once
			Result := <<>>
		end

feature -- Initialisation

	make(arg:ANY) is
		do
		end

	execute is
		local
			a_datum1: C_HISTORY[C_SINGLE_S]
			a_datum2: C_HISTORY[C_LIST_S]
			a_datum3: C_HISTORY[C_TABLE_S]
			a_datum4: C_HISTORY[C_TREE_S]
			c_evt_series: C_EVENT_SERIES[C_LIST_S]
			c_single_evt: C_SINGLE_EVENT[C_LIST_S]
			a_trans: C_COMPOSITION
			a_ehr: C_EHR
			a_obs: C_OBSERVATION
			a_eval: C_EVALUATION
			a_instr: C_INSTRUCTION
			a_e: C_ENTRY_PROXY
			c_a_t: ARCHETYPE_PROXY[C_COMPOSITION]
			c_dv_b: C_DV_BOOLEAN
			c_dv_mm: C_DV_MULTIMEDIA
			c_dv_p: C_DV_PARSABLE
			vt: VERSIONED_COMPOSITION
			c_dv_i: C_DV_INTERVAL[DV_QUANTITY]
			c_dv_o: C_DV_ORDINAL
			c_dv_qr: C_DV_QUANTITY_RATIO
			c_dv_pdt: C_DV_PARTIAL_DATE_TIME
			c_dv_pt: C_DV_PARTIAL_TIME
			c_dv_pd: C_DV_PARTIAL_DATE
			c_org: C_ORGANISER
		do
			
		end

feature -- Access

	check_result is
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
--| The Original Code is tc_c_history.e.
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
