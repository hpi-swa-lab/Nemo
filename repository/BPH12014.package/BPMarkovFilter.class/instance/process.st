private-processing
process

	self tokenToToken: Dictionary new.
	self tokenToSource: Dictionary new.
	self sourceToSource: Dictionary new.

	self retrieveStaticData.

	self tokens ifNotEmpty: [ :t | t reduce: [ :lastToken :token || lastSource source |
		lastSource := self sourceCode copyFrom: lastToken start to: lastToken end.
		source := self sourceCode copyFrom: token start to: token end.

		self tokenToToken at: lastToken type put:
			((self tokenToToken at: lastToken type ifAbsentPut: [ Bag new ]) add: token type; yourself).

		self tokenToSource at: lastToken type put:
			((self tokenToSource at: lastToken type ifAbsentPut: [ Bag new ]) add: source; yourself).

		self sourceToSource at: lastSource put:
			((self sourceToSource at: lastSource ifAbsentPut: [ Bag new ]) add: source; yourself).

		token]]