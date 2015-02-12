as yet unclassified
instanceID

	instanceID ifNil: [instanceID := self class uniqueInstanceID.].
	^ instanceID