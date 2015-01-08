as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		
		spec package: 'JSON' with: [
			spec repository: 'http://www.squeaksource.com/JSON'].

		"Internal packages."
		spec package: 'PipeOperator' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'SqueakOverflow' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository';
				requires: #(PipeOperator JSON)].

		spec
			group: 'default' with: #('core');
			group: 'core' with: #('SqueakOverflow')].