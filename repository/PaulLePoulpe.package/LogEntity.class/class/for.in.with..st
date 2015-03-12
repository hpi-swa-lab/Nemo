constructor
for:aLog in:aContext with:aTag
	|i|
	i:= self new.
	^i logBlock:aLog ; 
			  originObject: aContext receiver;
			  originSelector: aContext method selector;
			  arguments: aContext arguments;
			  tag: aTag;
			  pih: (Processor activeProcess hash \\ 999999);
			  timestamp: TimeStamp current;
			  yourself.
				