as yet unclassified
doesNotUnderstand: aMessage
	"Catch any unknown messages and delegate them to the internal object."

	internal := internal perform: aMessage selector withArguments: aMessage arguments.