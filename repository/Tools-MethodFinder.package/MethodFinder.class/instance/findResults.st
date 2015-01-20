search
findResults
	"Launch a search for expressions that compute the answers.  Return an OC of triples of 
	( selector,  expression string,  receiver and arg objects )
	(printStringBase:  'data2 printStringBase: data1'  (2 4))."

	data do: [:alist |
		alist isSequenceable ifFalse: [
			^ OrderedCollection with: 'first and third items are not Arrays']].
	Approved ifNil: [self initialize].	"Sets of allowed selectors"
	resultsList := OrderedCollection new.
	self search: true.	"multi"
	resultsList isEmpty & (noMoreRecursion == nil) ifTrue: [
		noMoreRecursion := true.
		resultsList := (MethodFinderStage2 new loadData: data answers: answers) searchForOne ].
	noMoreRecursion := nil.	"allow next time"
	^ (SortedCollection sortBlock: [:aa :bb | aa second < bb second]) addAll: resultsList
