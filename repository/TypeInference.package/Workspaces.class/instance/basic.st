as yet unclassified
basic
" 
	Logger reset.
	self new basic. return {<True class ?>}
	Logger show.
	Logger logs size.
	try
"
| string |

" Just mark & print and read the returning concrete type : )  "



" The code is not executed, just emulated : ) "

string := '
^True
'.
^ self infere: string.


