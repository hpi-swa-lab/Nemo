private-accessing
deleteAllItemMorphs

	self itemMorphs do: [:morph |
		morph delete.
	].