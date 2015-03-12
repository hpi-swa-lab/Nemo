documentation
samples
"

(1@1 nearestPointAlongLineFrom: 1@1 to: 10@10)   return {<Point x: <Float> y: <Float>>}
	degrees asInteger

(1@1) degrees  
(1.0@1.0) theta 

((1@1) degrees + (1.0@1.0) theta) asInteger 

1@1 onLineFrom: 0@0 to: 10@10 within: 0.5

1@1 nearestPointOnLineFrom: 0@0 to: 10@10

Change Set:		Ti-Engine
Date:			10 January 2000
Author:			Francisco Garau

This project is based on Ole Agensen thesis ([AGE/96] http://typeinference.swiki.net) with some improvements on the treatement of blocks and variables. His ideas about the parallelism between run time and type inference time, are taken a step further.

- In order to infer the type of any expresion, just paint it and select 'infer types' from the menu (or alternatebily Cmd-t). 
- Look at the Transcript to see what is going on. 
A any time, you can look at the Transcript to see how the abstract interpretation goes on. 
- If something goes wrong and a debugger is shown, and you want to analyze a new expression it is convenient to reset the state of the engine (particulary TiInterpreter). Just evaluate: TiSystem reset
- If you understand spanish look at TiNode tareas to see a detailed list of the things to be done. TiNode todo list what I consider the more importarnt things.

Now lets show some examples:

1073741824 type
	 return {<LargePositiveInteger>}
(1@1) type 

TObject returnFive
	 return {<SmallInteger>}

TObject simpleAssignement  
	return {<#hello>}
	return {<Symbol>}

TObject repeatedAssignement 
	return {<String>}

TObject randomBoolean
	 return {<True> <False>}

TObject returnGlobal
	 return {<WrapperWorldMorph ?>}

TObject assignementFromGlobal 
	return {<WrapperWorldMorph ?>}

5 + 1   
	return {<SmallInteger>}
5 + 1.0 
5 > 6.0 
1.0 + 3 
3 + 1.0 

SmallInteger maxVal + 1   return {<SmallInteger>}
	return {<SmallInteger>}
	or  return {<LargePositiveInteger> <SmallInteger> <LargeNegativeInteger>} if the the preference #inferLargeIntegers is enabled (and TiSystem is reset).

5 max: 6
	 return {<SmallInteger>}

5.0 max: 6.0
	 return {<Float>}

5.0 max: 6 
6 max: 5.0 
1.0 < 0 return 
1 halt < 1.0 
1 < (1/2)
1@1 + 1 
1 < 
Random new next 
10 atRandom 

1.0 < 2 ifTrue: [3] ifFalse: ['horse']
1.0 < 2 ifTrue: [3]


1@1 
	return {<Point x: <SmallInteger> y: <SmallInteger>>}

[5] 
	 return {<BlockContext {[5]}>}

[5] value 
	return {<SmallInteger>}

[:arg | arg] value: #hello 
	return {<#hello>}
	return {<Symbol>}

TObject nonLocalReturn   
	return {<Float> <TObject class ?>}

TObject doubleNestedBlocks  
	return {<UndefinedObject> <String>}

TObject testWhileTrue  
	return {<TObject class ?>}
	should return {<Symbol>} but the ReturnNode is missing in the parse tree. I think this is a Decompiler bug.

TObject testWhileTrue2  
	return {<TObject class ?>}
	return {<TObject>}

TObject multiBlockReturns  
	return {<SmallInteger> <TObject class ?> <String>}
	 return {<String> <SmallInteger> <TObject>}

TObject blockWithManyArguments 
	return {<Float>}

TObject twoBlocks 
	return {<TObject class ?>}
	return {<TObject>}

TObject repeatedArgumentNames  
	return {<#hello>}
	return {<Symbol>}

Point new  
	return {<Point x: <UndefinedObject> y: <UndefinedObject>>}

TPoint new  
	return {<TPoint x: <SmallInteger> y: <SmallInteger>>}

TPoint new changeX  
	return {<TPoint x: <String> y: <SmallInteger>>}

TPoint new changeSomething 
	return {<SmallInteger>}
	should return <String> but fails the syncronization from self to the instance variable x

TPoint new setX: $a y: 'something'   
	return {<TPoint x: <Character ?> y: <String>>}

TPoint new indirectChange  
	return {<TPoint x: <String> y: <SmallInteger>>}
	
TPoint new  changeSomething 
	return {<TPoint x: <Symbol> y: <SmallInteger>>}

T3DPoint new  
	return {<T3DPoint x: <SmallInteger> y: <SmallInteger> z: <SmallInteger>>}

T3DPoint new changeZ   
	return {<T3DPoint x: <SmallInteger> y: <SmallInteger> z: <#potatoe>>}
	return {<T3DPoint x: <SmallInteger> y: <SmallInteger> z: <Symbol>>}

T3DPoint new changeSomething  
	return {<T3DPoint x: <SmallInteger> y: <SmallInteger> z: <#potatoe>>}
	return {<T3DPoint x: <SmallInteger> y: <SmallInteger> z: <Symbol>>}

T3DPoint new indirectChange 
	return {<T3DPoint x: <SmallInteger> y: <SmallInteger> z: <Symbol>>}

TPoint new blockWithArgument 
	return {<TPoint x: <Symbol> y: <SmallInteger>>}

TPoint new blockModifyingArgument  
	 return {<TPoint x: <String> y: <SmallInteger>>}
	
TPoint new conditionalChangeX  
	 return {<TPoint x: <String> y: <SmallInteger>>}
	- should return {<TPoint x: <Symbol> y: <SmallInteger>>}
		- doesnt work because the the assignement to the instance variable 'x' is inside a block. That is, 'x' is a home reference.

[Syncronization between self and its instance variables]

TPoint new 
	return {<TPoint x: <SmallInteger> y: <SmallInteger>>}

TPoint new changeX   
	return {<TPoint x: <String> y: <SmallInteger>>}
	

[Acknowledgments]

There are many people who help this come true and wich I want to thank. First of all, Leandro Caniglia (my advisor) for all his enthusiasm, encouragement and dedication. Following his dynamic spirit, he promoted the creation of local group where we could talk about type inference. All my thanks to Valeria Murgia, Gerardo Richarte, Luciano Notarfrancesco, Alejandro Weil and Pablo Malvolta.

[Bibliography]

[AGE/96] 'Concrete Type Inference: Delivering Object-Oriented Applications' A dissertation submitted to the Department of Computer Science and the Committee on Graduate Studies of Stanford University in partial fulfillment of the requirements for the degree of Doctor of
Philosophy. (December 1995)
Ole Agesen
SMLI TR-96-52 January 1996
M/S 29-01
2550 Garcia Avenue
Mountain View, CA 94043
"