as yet unclassified
removeBlocks

	self interceptionBlockHashes do: [ :blockHashString |
		self class interceptionBlocks removeKey: blockHashString
	].