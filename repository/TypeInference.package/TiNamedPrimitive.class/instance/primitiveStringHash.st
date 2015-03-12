MiscPrimitivePlugin
primitiveStringHash

	 (self matchOrFail: {{ByteString class . ByteString . SmallInteger}}) ifNotNil: 	[
			^self createResult addReturn: (SmallInteger) createType.
	].
	^nil.