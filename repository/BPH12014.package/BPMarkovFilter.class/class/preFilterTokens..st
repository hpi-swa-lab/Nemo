filtering
preFilterTokens: aTokenCollection
	"filter cases like (action: # #symbol) cause the # is detected as seperate token, but again with the symboltext afterwards"
	^ aTokenCollection reject: [:token | (token type == #symbol) and: [token start = token end]]