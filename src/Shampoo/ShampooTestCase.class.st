Class {
	#name : #ShampooTestCase,
	#superclass : #TestCase,
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooTestCase >> requestFrom: aString [
	| xml |
	xml := ShampooXMLNode from: aString.
	^Request from: xml

]
