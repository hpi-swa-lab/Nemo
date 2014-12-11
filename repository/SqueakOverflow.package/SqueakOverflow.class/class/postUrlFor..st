url builder
postUrlFor: aPostId
	"Produces a stackoverflow post URL for a certain term (posts can be questions and/or answers)"

	| urlBase urlParams |
	
	urlBase := 'https://api.stackexchange.com/', self apiVersion , '/posts/'.
	urlParams := '?',
		'key=', self apiKey, '&',
		'order=desc&',
		'sort=activity&',
		'site=stackoverflow&',
		'filter=withbody'.
	
	^(urlBase, aPostId asString, urlParams) urlEncoded.