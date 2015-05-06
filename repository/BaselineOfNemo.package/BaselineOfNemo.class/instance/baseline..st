as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec project: 'BaselineOfCOPPlayground' with: [
			spec
				className: 'BaselineOfCOPPlayground';
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'VB-Regex' with: [
			spec
				repository: 'http://www.squeaksource.com/Regex'].

		spec package: 'Traits' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'AST-Core' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'Nemo' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository';
				requires: #('Traits' 'AST-Core' 'VB-Regex')].

		spec
			group: 'default' with: #('core');
			group: 'TravisCI' with: #('core');
			group: 'core' with: #('Nemo') ]