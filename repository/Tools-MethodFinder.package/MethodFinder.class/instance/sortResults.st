search
sortResults
	"Sort selectors, expressions, and objects in alphabetical order of their selectors."

	| rl |
	rl := resultsList.
	resultsList := SortedCollection sortBlock: [:aa :bb | aa first < bb first].
	resultsList addAll: rl.
	^ resultsList