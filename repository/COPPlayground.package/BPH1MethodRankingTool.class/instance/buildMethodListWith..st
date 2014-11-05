as yet unclassified
buildMethodListWith: aBuilder
	
	^aBuilder pluggableListSpec new
		model: self;
		list: #methodRanking;
		yourself.