url builder
searchUrlFor: aSearchTerm
	"Produces a stackoverflow search URL for a certain term"

	| url term |
	
	url := 'https://api.stackexchange.com/', self apiVersion, '/search?',
		'key=', self apiKey, '&',
		'order=desc&',
		'sort=activity&',
		'tagged=smalltalk&',
		'site=stackoverflow&'.
		
	term := 'intitle=', aSearchTerm.
	
	^(url, term) urlEncoded.