preferences
displayDebugInformation
	<preference: 'Display debug information'
	category: 'Nemo Browser'
	description: 'If true, displays additional information, e.g. the ranking numbers and the type guessing source'
	type: #Boolean>
	^ DisplayDebugInformation ifNil: [ false ]