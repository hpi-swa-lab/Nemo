examples
example
	"Sample code for usage of this stuff."

	^(1 to: 100) asPipe
		select: [ :x | (x rem: 2) = 0 ];
		select: [ :x | (((x - 1) * 2) rem: 3) = 0 ];
		collect: [ :x | x quo: 4 ];
		select: [ :x | x < 15 ];
		collect: [ :x | x asWords ];
		do.  "#('one' 'two' 'four' 'five' 'seven' 'eight' 'ten' 'eleven' 'thirteen' 'fourteen')"