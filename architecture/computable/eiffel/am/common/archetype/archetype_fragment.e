indexing
	component:   "openEHR Common Archetype Model"
	
	description: "[
			 Parent of all archetype fragment classes. Archetype equivalent to 
			 LOCATABLE class in Common reference model. Defines common constraints 
			 for any inheritor of LOCATABLE in any reference model.
			 ]"
	keywords:    "archetype"
	
	design:      "openEHR Common Archetype Model 0.3"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/common/archetype/SCCS/s.archetype_fragment.e $"
	revision:    "$Revision$"
	last_change: "$Date$"

deferred class ARCHETYPE_FRAGMENT

inherit
	ARCHETYPE_NODE

feature -- Access

	c_name: C_DV_TEXT	
			-- Constraint on the name of the fragment.

	meaning: DV_TEXT	
			-- The normative meaning of the fragment.

	invariants: LIST[DV_PARSABLE]	
			-- List of invariant expressions for this archetype as a whole.
			
	archetype_head: ARCHETYPE	
			-- The head of the archetype, containing all relevant definitional information. 
			-- Non-Void only is this is the root node.

feature -- Comparison

	is_subset_of(af: like Current):BOOLEAN is
			-- True if the constraint described by this archetype describes a constraint
			-- which is a subset of 'af'
		deferred
			
		end

	item_at_path (a_path: STRING): ARCHETYPE_FRAGMENT is
			-- 	Return the item at a path.
		require
			has_path(a_path)
		do
		end

feature -- Status Report

	is_archetype_root: BOOLEAN	
			-- This fragment is the root node of this archetype tree.

	has_path (a_path: STRING): BOOLEAN is	
			-- Report whether this archetype has a particular path.
		require
			Path_valid: a_path /= Void and then not a_path.is_empty
		do
		end

feature -- Validation

	is_valid (x: LOCATABLE): BOOLEAN is
			-- Validate runtime data against this archetype.
		do
			
		end

feature -- Factory
	
	create_default: LOCATABLE is
			-- create default structure
		deferred
			
		end
	
invariant
	c_name_exists: c_name /= Void
	meaning_valid: meaning /= Void	
	Archetype_root_valid: is_archetype_root xor archetype_head = Void
	Archetype_invariants_valid: invariants /= Void implies is_archetype_root

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
--| The Original Code is archetype_fragment.e.
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
