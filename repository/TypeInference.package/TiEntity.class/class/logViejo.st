spanish documentation
logViejo
"

(OrderedCollection new add: 1; add: 2; add:3; yourself)
AtomicType instanceCount
Smalltalk do: [:e| e instanceCount]
(AtomicType fromObject: 5@2) instanceCount

(AtomicType fromObject: 5@1) identityHash 737
(AtomicType fromObject: 6@8) identityHash 1077

(AtomicType fromObject: 5.0@1) = (AtomicType fromObject: 6@8.0) 

AtomicType fromObject: 1/1000000000000

AtomicType fromObject: 5@1
AtomicType fromObject: #(1 2 3 'hola')

Array new
#(1 2 3) collect: [:e | e + 1]
#(), #(1), #()

	| a b c d e x y |
	x := {1. {2. 3}. 4}.
	{a. {b. c}. d. e} := x, {5}, {}.
	y := {a} := {0}.
	{} := {}.
	^{e. d. c. b. a + 1. y first} as: Set

Clases que tienen variables de clase y shared pools definidos
	B3DEnginePart
	Wonderland
	CharRecog
	ParagraphEditor

Object subclass: #Wonderland
	instanceVariableNames: ''
	classVariableNames: 'ActorPrototypeClasses '
	poolDictionaries: 'WonderlandConstants '
	category: 'Wonderland-Core'

ImageMorph subclass: #WonderlandCameraControls
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'WonderlandConstants '
	category: 'Wonderland-Morphs'

------------------------
TITemplate initialize.
TITemplate templates


(TITemplate class: Point selector: #changeX)
(TITemplate class: TINode class selector: #new)

(TITemplate class: SmallInteger selector: #<)
TINode new halt testBlock: false 

nodo := TINode new seed: (AtomicType forClass: SmallInteger).
(TITemplate class: SmallInteger selector: #yourself)
	halt connect: nodo receiverType: (nodo type) actualArgs: #()

Para simular la ejecucion de bloques: ContextPart


ContextPart trace: [3 factorial]

 LLamadas a primitivas: 2024 
(Smalltalk allClasses  inject: 0 into: [ :sum :aClass | sum +
	((aClass selectors select: [:aSymbol |
		(aClass compiledMethodAt: aSymbol) primitive ~= 0]) size)])


Para averiguar el uso de las primitivas
(primitives := Dictionary new.
1 to: 255 do: [:anInteger |
	classes := Dictionary new.
	(Smalltalk allClasses do: [ :aClass |	
		selectors := (aClass selectors select: [:aSymbol |
			(aClass compiledMethodAt: aSymbol) primitive = anInteger]).
		(selectors size > 0) ifTrue: [classes at: aClass put: selectors]]).
		primitives at: anInteger put: classes.].
primitives)

Smalltalk allClasses  : [ :sum :aClass | sum +
	aClass := RegistroEdenor.
	(((aClass selectors select: [:aSymbol |
		(aClass compiledMethodAt: aSymbol) primitive ~= 0]))
		collect: [:aSymbol | aClass compiledMethodAt: aSymbol]) 
]

<Integer Hierarchy. Integer Hierarchy. TextPrintIt Comment. RunArray class scanFrom:. (Color r: 0.0 g: 0.0 b: 1.0)>

template := TITemplate class: TINode selector: #testYourself.
template connect: (template graph return) actualArgs: #()
graph return 

self halt.
x := 1.
y := 5.
x max: y. 

TITemplate buildGraphForClass: Magnitude selector: #max:

Compiler new 
	parse: (ReadStream on: '1')
	in: Integer  
	notifying: nil 

Compiler new 
	evaluate: (ReadStream on: '|x| x_1.')
	in: nil   		aContext
	to: nil   		receiver
	notifying: nil	aRequestor 
	ifFail: []

Parser new parseArgsAndTemps: '5 max: 4' notifying: nil

TITemplate class: Symbol selector: #printOn:
TITemplate class: Symbol selector: #printOn:
TITemplate class: Integer selector: #printOn:
 
| mt |
mt := TITemplate class: TINode selector: #test.
mt connect: mt graph receiver actualArgs: #().

#(#(1 2 3) #($a $b $c)) halt cartesianProduct 
 Set ((1 $a ) (2 $a ) (3 $a ) (3 $b ) )
#(1 1 2 3 4) asSet
Magnitude decompilerClass new decompile: #max: in: Magnitude method: (Magnitude compiledMethodAt: #max:)

Magnitude decompilerClass new decompile: #testPoolVarFor: in: TINode method: (TINode compiledMethodAt: #testPoolVarFor:)


Magnitude allSelectors

StringHolder open
(SystemWindow labelled: 'pancho') openInWorld: World

"