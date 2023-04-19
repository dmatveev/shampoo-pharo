Class {
	#name : #ShampooXMLText,
	#superclass : #ShampooXMLNode,
	#category : #'Shampoo-XML'
}

{ #category : #'as yet unclassified' }
ShampooXMLText class >> text: aString [
	^self new underlyingXML: (XMLString string: aString)
]
