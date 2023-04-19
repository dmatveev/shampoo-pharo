Class {
	#name : #BaselineOfShampoo,
	#superclass : #BaselineOf,
	#category : #BaselineOfShampoo
}

{ #category : #baselines }
BaselineOfShampoo >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Dependencies"
				spec baseline: 'XMLParser' with: [ spec repository: 'github://svenvc/XML-Support-Pharo' ].
			
				"Packages (in fact, there's only one...)" 
				spec package: 'Shampoo-hacks'.
				spec package: 'Shampoo' with: [ spec requires: #('Shampoo-hacks') ]]
]
