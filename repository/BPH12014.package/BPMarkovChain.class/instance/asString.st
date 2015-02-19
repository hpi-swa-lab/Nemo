converting
asString
	^ (self tailSource allButFirst join: ' ') , ' (' , self count asString , ')'