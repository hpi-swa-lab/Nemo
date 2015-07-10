preferences
rankMethodsByMatchingParameterTypes
	<preference: 'Rank methods by matching bindings with parameter types'
	category: 'Nemo Browser'
	description: 'If true, temporary variables and parameters will be checked for bindings and matched against parameter types of suggested methods.'
	type: #Boolean>
	^ RankMethodsByMatchingParameterTypes ifNil: [ false ]