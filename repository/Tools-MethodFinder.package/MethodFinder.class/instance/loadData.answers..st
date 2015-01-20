initialize
loadData: dd answers: aa
	"a quick entry for a recursive call"

data := dd.
answers := aa.
argMap _ (1 to: data first size) asArray.
data do: [:list | list size = argMap size ifFalse: [
		self inform: 'data arrays must all be the same size']].
argMap size > 4 ifTrue: [self inform: 'No more than a receiver and 
three arguments allowed'].
	"Really only test receiver and three args." 
thisData _ data copy.
mapStage _ mapList _ nil.
