accessing
baseTrait: aTrait
	baseTrait ifNotNil:[self error: 'Already initialized'].
	baseTrait := aTrait.