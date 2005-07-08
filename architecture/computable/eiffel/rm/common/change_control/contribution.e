indexing
	component:   "openEHR Common Reference Model"

	description: "[
			 Contribution comprising one or more versions. A contribution
			 is like a 'change request', i.e. contains the audit information
			 relating to a change, and the list of things changed.
			 ]"
	keywords:    "version control"

	design:      "openEHR Common Reference Model 1.4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/common/change_control/SCCS/s.contribution.e $"
	revision:    "$Revision$"
	last_change: "$Date$"

class CONTRIBUTION

inherit
	AUDIT_DETAILS
		export 
			{NONE} all
		end

	OPENEHR_TERMINOLOGY_IDS
		export 
			{NONE} all
		end

create
	make
	
feature -- Initialisation

	make(a_node: STRING; a_committer: PARTY_REF; a_time_committed: DV_DATE_TIME; a_description: DV_TEXT) is
			-- commit new version. No locking (i.e. checking out) is needed to commit. 
			-- 'parent_version_id' is the id of latest version in this VERSIONED<T>, at the time of
			-- taking the copy for modification. If the commit is to create the first version, the 
			-- 'parent_version_id' must be "none".
		require
			Description_valid: a_description /= Void
		do
			make_audit_details(a_node, a_committer, a_time_committed)
			description := a_description
		ensure
			description_set: description = a_description
		end

feature -- Access
	
	uid: OBJECT_ID	
			-- Unique identifier for this contribution.

	description: DV_TEXT
			-- description of this contribution overall

	versions: SET [OBJECT_ID]

invariant
	Uid_exists: uid /= Void
	Description_valid: description /= Void
	Versions_valid: versions /= Void and then not versions.is_empty
	-- name_valid: name.value.is_equal(committer.id.value + "@" + node + "@" + time_committed.as_string)

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
--| The Original Code is contribution.e.
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
