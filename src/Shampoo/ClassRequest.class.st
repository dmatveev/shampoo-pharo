"
My instances are used to query an information about a
class in a namespace
"
Class {
	#name : #ClassRequest,
	#superclass : #Request,
	#instVars : [
		'className',
		'spaceName',
		'side'
	],
	#category : #'Shampoo-Requests'
}

{ #category : #identification }
ClassRequest class >> is: aString [
            ^aString = 'Class'

]

{ #category : #execution }
ClassRequest >> execute [
            | class |
            class := Smalltalk at: className asSymbol.
            (side = #class) ifTrue: [class := class class].
            ^ClassResponse
                id: id
                class: className
                superclass: class superclass printString
                instvars: class instVarNames asStringArray
                classvars: class classVarNames asStringArray
                poolvars: class sharedPools asStringArray

]

{ #category : #private }
ClassRequest >> init: anXML [
            | attrs |
            attrs := anXML attrMap.
            className := attrs at: 'class'.
            spaceName := attrs at: 'namespace'.
            side := (attrs at: 'side') asSymbol.

]
