instance creation
with: aTraitComposition aliases: anArrayOfAssociations
	self assertValidAliasDefinition: anArrayOfAssociations.
	^self new
		subject: aTraitComposition;
		initializeFrom: anArrayOfAssociations;
		yourself