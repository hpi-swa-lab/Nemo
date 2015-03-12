returns
usingABlockReturnArg: anObject
	"
	TObject usingABlockReturnArg: 1@1
	TObject usingABlockReturnArg: 1
	"
	^ [:arg | TObject returnArg: arg] value: anObject 
