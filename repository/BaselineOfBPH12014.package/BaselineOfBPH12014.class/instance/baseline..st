as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
"		spec project: 'BaselineOfCOPPlayground' with: [
			spec
				className: 'BaselineOfCOPPlayground';
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec project: 'SqueakOverflow' with: [
			spec
				className: 'BaselineOfSqueakOverflow';
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'AST-Core' with: [
			spec
				repository: 'http://www.squeaksource.com/rb'].
"
		spec package: 'BPH12014-AST-UI' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].
"
		spec package: 'BPH12014-CodeEditor' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository';
				requires: #('AST-Core')].

		spec package: 'BPH12014-StaticAnalysis' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].
"
		spec
			group: 'default' with: #('core');
			group: 'core' with: #('BPH12014-AST-UI' "'BPH12014-CodeEditor' 'BPH12014-StaticAnalysis' 'BaselineOfCOPPlayground' 'SqueakOverflow'")].