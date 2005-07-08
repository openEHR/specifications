indexing

	component:   "openEHR Data Types Archetype Model"
	
	description: "[
			 Serves as a common ancestor of all archetyped data value types in the this model. 
			 Defines the abstract signature of the features valid_value and default_value.
			 ]"
	keywords:    "archetype, data"
	
	design:      "openEHR Data Types Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/am/data_types/basic/SCCS/s.c_data_value.e $"
	revision:    "$Revision: 1.1 $"
	last_change: "$Date: 03/11/14 14:08:07+00:00 $"

deferred class C_DATA_VALUE

feature -- Status Report

	valid_value (a_value: DATA_VALUE):BOOLEAN is 
		require
			Value_exists: a_value /= Void
		deferred
		ensure
			not Result xor invalid_reason /= Void
		end

feature -- Access

	target_type: STRING is 
			-- remove the leading "C_" to get a DATA_VALUE descendant name being 
			-- constrained by this C_DATA_VALUE
		do
			Result := generator
			Result.replace_substring("", 1, 2)
		ensure
			Result /= Void and then not Result.is_empty
		end

	default_value: DATA_VALUE is
			-- computed default value
		deferred
		ensure
			Result_valid: Result /= Void and then valid_value(Result)
		end

	invalid_reason: ERROR	

feature -- Output

	as_string:STRING is
			-- String form of data item, i.e. a short, human-readable form of the data item. 
			-- Not guaranteed to contain all attributes.
		deferred
		ensure
			Result /= Void	
		end

	as_canonical_string:STRING is
			-- Standardised string form of data item, in tagged XML format, including all attributes.
		deferred
		ensure
			Result /= Void	
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
--| The Original Code is c_data_value.e.
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
