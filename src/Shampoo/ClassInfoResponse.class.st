"
My instances hold some generic information about a concrete
class in the concrete namespace. See more in my subclasses.
"
Class {
	#name : #ClassInfoResponse,
	#superclass : #Response,
	#instVars : [
		'class',
		'attrs'
	],
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
ClassInfoResponse class >> id: anInteger class: aClass [
            ^self id: anInteger class: aClass attrs: nil

]

{ #category : #'instance creation' }
ClassInfoResponse class >> id: anInteger class: aClass attrs: anArray [
            ^(self id: anInteger)
                class: aClass attrs: anArray
                yourself

]

{ #category : #marshalling }
ClassInfoResponse >> asXML [
            | r |
            r := super asXML.
            r addAttribute: 'class' value: class.
            attrs ifNotNil:
              [:dict |
              dict keysAndValuesDo: 
                  [:key :value | r addAttribute: key value: value]].
            ^r

]

{ #category : #'*Shampoo-Tests' }
ClassInfoResponse >> attrs [
            ^attrs

]

{ #category : #private }
ClassInfoResponse >> class: aClass attrs: anArray [
            class := aClass.
            anArray isNil ifFalse:
			[attrs := Dictionary new.
			anArray do: [:each | attrs at: each key put: each value]]

]

{ #category : #'*Shampoo-Tests' }
ClassInfoResponse >> className [
            ^class

]
