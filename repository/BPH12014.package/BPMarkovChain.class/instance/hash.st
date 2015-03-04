comparing
hash
	^ hash ifNil: [ hash := self tailSource hash ]