type propagation
seedResult: aTiMessageResult

	receiver seedResult: aTiMessageResult receiver.
	arguments with: aTiMessageResult arguments
		do: [:arg :resultTypeSet | arg seedResult: resultTypeSet].
	"self halt."
	slot seedAll: aTiMessageResult return.