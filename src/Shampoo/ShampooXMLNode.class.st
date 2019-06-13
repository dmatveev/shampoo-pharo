Class {
	#name : #ShampooXMLNode,
	#superclass : #Object,
	#instVars : [
		'underlyingXML'
	],
	#category : #'Shampoo-XML'
}

{ #category : #'as yet unclassified' }
ShampooXMLNode class >> from: aString [
	| stream doc |
	stream := aString readStream.
	doc := XMLDOMParser parse: stream.
	^self new underlyingXML: doc root 
]

{ #category : #'as yet unclassified' }
ShampooXMLNode class >> tagname: aString [
	^self new underlyingXML: (XMLElement named: aString)
]

{ #category : #accessing }
ShampooXMLNode >> addAttribute: anAttributeName value:  aValueString [
	underlyingXML attributeAt: anAttributeName put: aValueString
]

{ #category : #accessing }
ShampooXMLNode >> addNode: aNode [
	underlyingXML addNode: aNode underlyingXML  
]

{ #category : #'as yet unclassified' }
ShampooXMLNode >> attrMap [
	^underlyingXML attributes
]

{ #category : #accessing }
ShampooXMLNode >> elementsNamed: aString [
	| subnodes |
	subnodes := underlyingXML nodes select: [:each | each name = aString].
	^subnodes asArray collect: [:each | ShampooXMLNode new underlyingXML: each]
]

{ #category : #accessing }
ShampooXMLNode >> printOn: aStream [
	underlyingXML printOn: aStream  
]

{ #category : #accessing }
ShampooXMLNode >> text [
	^underlyingXML contentString
]

{ #category : #accessing }
ShampooXMLNode >> underlyingXML [
	^ underlyingXML
]

{ #category : #accessing }
ShampooXMLNode >> underlyingXML: anObject [
	underlyingXML := anObject
]
