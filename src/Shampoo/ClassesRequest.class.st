"
My instances are used to query a list of classes in a
namespace.
"
Class {
	#name : #ClassesRequest,
	#superclass : #Request,
	#instVars : [
		'namespace'
	],
	#category : #'Shampoo-Requests'
}

{ #category : #identification }
ClassesRequest class >> is: aString [
            ^aString = 'Classes'

]

{ #category : #execution }
ClassesRequest >> execute [
            | classes |
		classes := Smalltalk allClasses select: [:each | each category asString = namespace].
            ^ClassesResponse id: id names: (classes collect: [:each | each name asString])

]

{ #category : #private }
ClassesRequest >> init: anXML [
            namespace := anXML attrMap at: 'namespace'

]
