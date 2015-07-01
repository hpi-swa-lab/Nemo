preferences
forkingTimeout
	<preference: 'Forking timeout'
	category: 'Nemo Browser'
	description: 'The time in milliseconds the Nemo system will wait synchronous to evaluate statements in the forked VM. When timeout expires, the forked process will be terminated.'
	type: #Number>
	^ ForkingTimeout ifNil: [ 250 ]