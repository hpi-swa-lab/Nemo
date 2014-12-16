as yet unclassified
replaceTypeHintTextMorphWith: aTextMorph

	self class TypeHintTextMorph ifNotNil: [self class TypeHintTextMorph delete.].
	self class TypeHintTextMorph: aTextMorph.
	self class TypeHintTextMorph openInWorld.