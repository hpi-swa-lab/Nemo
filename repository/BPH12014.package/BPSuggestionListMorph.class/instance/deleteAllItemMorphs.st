as yet unclassified
deleteAllItemMorphs

	self itemMorphs do: [:morph |
		morph delete.
	].