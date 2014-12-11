url builder
postsUrlFor: aPostIdList
	"Produces a stackoverflow post URL for a certain term (posts can be questions and/or answers)"

	| urlBase urlParams term |
	
	urlBase := 'https://api.stackexchange.com/', self apiVersion , '/posts/'.
	urlParams := '?',
		'key=', self apiKey, '&',
		'order=desc&',
		'sort=activity&',
		'site=stackoverflow&',
		'filter=withbody'.
		
	term := (aPostIdList collect: [ :i | i asString ]) join: ';'. 
	
	^(urlBase, term, urlParams) urlEncoded.