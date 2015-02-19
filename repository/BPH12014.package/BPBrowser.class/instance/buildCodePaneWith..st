toolbuilder
buildCodePaneWith: builder
	| textSpec top buttonSpec annoSpec |
	self wantsOptionalButtons ifTrue: [
		top := builder pluggablePanelSpec new.
		top children: OrderedCollection new.
		buttonSpec := self buildOptionalButtonsWith: builder.
		buttonSpec frame: self optionalButtonsFrame.
		top children add: buttonSpec].
	textSpec := BPPluggableSuggestionCodePaneSpec new.
	textSpec 
		model: self;
		getText: #contents; 
		setText: #contents:notifying:; 
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:.
	self wantsAnnotationPane ifTrue: [
		top ifNil: [
			top := builder pluggablePanelSpec new.
			top children: OrderedCollection new].
		annoSpec := builder pluggableInputFieldSpec new.
		annoSpec model: self; getText: #annotation; setText: #annotation:. 
		annoSpec frame: self annotationFrame.
		top children add: annoSpec].
	top ifNotNil: [
		textSpec frame: self textFrame.
		top children add: textSpec].
	^top ifNil: [textSpec]