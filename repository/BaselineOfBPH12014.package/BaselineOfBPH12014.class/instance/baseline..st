as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec project: 'BaselineOfCOPPlayground' with: [
			spec
				className: 'BaselineOfCOPPlayground';
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].


		spec package: 'BPH12014-AST-UI' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec
			group: 'default' with: #('core');
			group: 'core' with: #('BPH12014-AST-UI' 'BaselineOfCOPPlayground')].