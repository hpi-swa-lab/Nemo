spanish documentation
aplicaciones
"

[Static checking]

- WillNotUnderstand
- Warning cuando se envian metodos de la categoria 'private'


[Application delivery]

- Reemplazar los simbolos por enteros (para achicar la imagen)
	Symbol allInstances size -> 20278
	Symbol allInstances inject: 0  into: [:acum :symbol | acum := acum + symbol size. acum ] 	-> 316216
	20278 * 4  -> 81112. (Cada entero ocupa 4 bytes).
	316216 - 81112  -> 235104 = 229 kb
	Conclusion: Convirtiendo los simbolos a enteros se logra un ahorro de 229 Kb.
- Extraer todos los simbolos para traducirlos

[Browsing]

- Message Browser

"