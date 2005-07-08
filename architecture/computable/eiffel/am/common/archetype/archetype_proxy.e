indexing
	component:   "openEHR Common Archetype Model"
	
	description: "[
			 Proxy for an archetype root, containing the constraint definition
			 for possible allowed archetypes at the point where this proxy
			 appears.
			 ]"
	keywords:    "archetype"
	
	design:      "openEHR Commmon Archetype Model 0.3"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/common/archetype/SCCS/s.archetype_proxy.e $"
	revision:    "$Revision: 1.1 $"
	last_change: "$Date: 03/11/14 14:08:05+00:00 $"

class ARCHETYPE_PROXY [G -> ARCHETYPE_FRAGMENT]

inherit
	ARCHETYPE_NODE

feature -- Initialization

	make(a_constrainer: C_ARCHETYPE) is
		require
			a_constrainer /= Void
		do
			constrainer := a_constrainer
		ensure
			Constrainer_set: constrainer = a_constrainer
		end

feature -- Modify

	install(an_archetype_fragment: G) is
		require
			archetype_valid: an_archetype_fragment /= Void and then an_archetype_fragment.is_archetype_root
		do
			target := an_archetype_fragment
		end

feature -- Access

	constrainer: C_ARCHETYPE
			-- constainer for archetype

	archetype_installed: BOOLEAN is
			-- True if and archetype has been chosen and installed
		do
			Result := target /= Void
		end

	target: G
			-- the installed archetype 

invariant
	constrainer_exists: constrainer /= Void
	target /= Void implies archetype_installed
	target_valid: target.is_archetype_root

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
--| The Original Code is archetype_proxy.e.
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
