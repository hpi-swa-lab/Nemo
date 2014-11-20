as yet unclassified
buildObserveButtonWith: aBuilder
	
	^aBuilder pluggableButtonSpec new
		model: self;
		label: 'Toggle Observation';
		action: #toggleObserve.