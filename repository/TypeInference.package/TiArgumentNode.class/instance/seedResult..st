type propagation
seedResult: aTypeSet
	resultSlot isNil ifTrue: [^ self].
	resultSlot seedAll: aTypeSet.
