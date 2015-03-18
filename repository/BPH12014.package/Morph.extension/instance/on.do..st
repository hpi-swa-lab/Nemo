*BPH12014-UI
on: anEventSymbol do: aBlock

	(self eventProperty at: anEventSymbol ifAbsentPut: [OrderedCollection new.])
		add: aBlock.