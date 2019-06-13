"
My instances are used to query a list of available namespaces
in the image.
"
Class {
	#name : #NamespacesRequest,
	#superclass : #Request,
	#category : #'Shampoo-Requests'
}

{ #category : #identification }
NamespacesRequest class >> is: aString [
            ^aString = 'Namespaces'

]

{ #category : #execution }
NamespacesRequest >> execute [
            | names |
            names := (Smalltalk allClasses collect: [:each | each category asString]) asSet asSortedCollection.
            ^NamespacesResponse id: id names: names

]
