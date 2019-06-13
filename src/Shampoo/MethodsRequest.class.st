"
My instances are used to query a list of methods in a concrete
category of a concrete class from a concrete namespace.
"
Class {
	#name : #MethodsRequest,
	#superclass : #Request,
	#instVars : [
		'className',
		'spaceName',
		'side',
		'cat'
	],
	#category : #'Shampoo-Requests'
}

{ #category : #identification }
MethodsRequest class >> is: aString [
            ^aString = 'Methods'

]

{ #category : #execution }
MethodsRequest >> execute [
            | class methods allMethods |
            class := Smalltalk at: className asSymbol.
            (side = #class) ifTrue: [class := class class].

            allMethods := class methodDictionary ifNil: [#()] ifNotNil: [:x | x associations].

            methods := (cat = '*'
                ifTrue: [allMethods]
                ifFalse: [allMethods select: [:e | e value category = cat]]).

            ^MethodsResponse
                id: id
                class: className
                methods: (methods collect: [:each | each key asString]) asSortedCollection

]

{ #category : #private }
MethodsRequest >> init: anXML [
            | attrs |
            attrs := anXML attrMap.
            className := attrs at: 'class'.
            spaceName := attrs at: 'namespace'.
            side := (attrs at: 'side') asSymbol.
            cat := attrs at: 'category'

]
