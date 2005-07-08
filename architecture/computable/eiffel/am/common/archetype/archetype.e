indexing
	component:   "openEHR Common Archetype Model"
	
	description: "[
			 Archetype equivalent to ARCHETYPED class in Common reference model. 
			 An ARCHETYPE object is the 'head' object in an archetype structure. 
			 Its 'root' attribute points to the root node of the formal structure.
			 Defines model of identfication, lifecycle, versioning, composition and 
			 specialisation.
			 ]"
	keywords:    "archetype"
	
	design:      "openEHR Commmon Archetype Model 0.3"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/common/archetype/SCCS/s.archetype.e $"
	revision:    "$Revision: 1.1 $"
	last_change: "$Date: 03/11/14 14:08:05+00:00 $"

deferred class ARCHETYPE

feature -- Access

	uid: OBJECT_ID
			-- globally unique id for root objects of archetyped structures

	id: ARCHETYPE_ID	
			-- multi-axial Identifier of this archetype.

	specialisation_parent_id: ARCHETYPE_ID	
			-- Identifier of the parent of this archetype. All archetypes have the 
			-- “any” archetype as parent if there is no other parent.

	description: ARCHETYPE_DESCRIPTION	
			-- Description and Lifecycle information of the archetype.

	status: DV_STATE
			-- Lifecycle status, derived from lifecycle attribute.

	version: STRING is
			-- Version of this archetype, extracted from id.
		do
		end

	parent_version: STRING is
			-- Version of parent archetype of this archetype, extracted from id.
		do
		end

	interface: LIST[INTERFACE_ITEM] is
			-- Derived interface of the whole archetype as a list of leaf names with their associated paths.
		do
		end
		
	root: ARCHETYPE_FRAGMENT
			-- root node of this archetype structure

	sub_archetypes: LIST[ARCHETYPE_PROXY[ARCHETYPE_FRAGMENT]] is
			-- Sub-archetypes of this archetype, i.e. other archetypes connected by composition to this one.
			-- derived by inspecting actual sub archetypes of subtype of this class
		do
		end

invariant
	id_exists: id /= Void
	specialisation_parent_id_exists: specialisation_parent_id /= Void
	root_exists: root /= Void

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
--| The Original Code is archetype.e.
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
