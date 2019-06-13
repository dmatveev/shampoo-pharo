Class {
	#name : #ShampooPrintItTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'printit'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooPrintItTest >> printItSample [
	^'<request id="80" type="PrintIt">2 + 2 * 2</request>'

]

{ #category : #'as yet unclassified' }
ShampooPrintItTest >> setUp [
	printit := self requestFrom: self printItSample

]

{ #category : #'as yet unclassified' }
ShampooPrintItTest >> testPrintIt [
	| r |
            r := printit execute.
            self should: [r value = 8]

]
