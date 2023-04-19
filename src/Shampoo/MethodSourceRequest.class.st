"
My instances are used to query the source of a concrete method
in a concrete class from a concrete namespace.
"
Class {
	#name : #MethodSourceRequest,
	#superclass : #Request,
	#instVars : [
		'className',
		'spaceName',
		'side',
		'name'
	],
	#category : #'Shampoo-Requests'
}

{ #category : #identification }
MethodSourceRequest class >> is: aString [
            ^aString = 'MethodSource'

]

{ #category : #execution }
MethodSourceRequest >> execute [
            | class method |
            class := Smalltalk at: className asSymbol.
            (side = #class) ifTrue: [class := class class].

            method := class methodDictionary at: name asSymbol.

            ^MethodResponse
                id: id
                class: className
                method: name
                source: method getSource

]

{ #category : #private }
MethodSourceRequest >> init: anXML [
            | attrs |
            attrs := anXML attrMap.
            className := attrs at: 'class'.
            spaceName := attrs at: 'namespace'.
            side := (attrs at: 'side') asSymbol.
            name := attrs at: 'method'

]
