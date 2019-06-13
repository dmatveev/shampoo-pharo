"
My instances are used to query a list of the method categories
in a concrete class from a concrete namespace.
"
Class {
	#name : #CategoriesRequest,
	#superclass : #Request,
	#instVars : [
		'className',
		'spaceName',
		'side'
	],
	#category : #'Shampoo-Requests'
}

{ #category : #identification }
CategoriesRequest class >> is: aString [
            ^aString = 'Categories'

]

{ #category : #execution }
CategoriesRequest >> execute [
            | class cats |
            class := Smalltalk at: className asSymbol.
            (side = #class) ifTrue: [class := class class].

            cats := Set new.
            class methodDictionary ifNotNil: [:d | d values do:
            [:each | cats add: each category]].

            ^MethodCategoriesResponse
                id: id
                class: className
                categories: cats asSortedCollection

]

{ #category : #private }
CategoriesRequest >> init: anXML [
            | attrs |
            attrs := anXML attrMap.
            className := attrs at: 'class'.
            spaceName := attrs at: 'namespace'.
            side := (attrs at: 'side') asSymbol

]
