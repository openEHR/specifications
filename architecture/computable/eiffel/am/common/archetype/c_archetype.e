indexing
	component:   "openEHR Common Archetype Model"
	
	description: "[
			 Constraint on composition of archetypes. Used to constrain which 
			 archetypes are allowed to occur in a given “slot” in another archetype, 
			 i.e. to express the compositional structure of archetypes.

			 EXPERIMENTAL. This attributes of this class probably have to be replaced 
			 by a nested boolean expression including these attributes. The current 
			 class definition can be used for simple systems in which an “or” relationship 
			 can be assumed between the separate conditions.
			 ]"
	keywords:    "archetype"
	
	design:      "openEHR Commmon Archetype Model 0.3"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/common/archetype/SCCS/s.c_archetype.e $"
	revision:    "$Revision: 1.1 $"
	last_change: "$Date: 03/11/14 14:08:05+00:00 $"

class C_ARCHETYPE

feature -- Access

	c_id: SET[C_ARCHETYPE_ID]
			-- Ids of allowed archetypes.

	c_parent_id: SET[C_ARCHETYPE_ID]
			-- Ids of allowed parent archetypes. Allows any archetype with a certain parent to be used.

	c_interface: SET[INTERFACE_ITEM]
			-- Constrain via allowed interface, e.g. certain required paths or leaf items.

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
--| The Original Code is c_archetype.e.
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
