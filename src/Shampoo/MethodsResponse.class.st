"
My instances hold a lists of methods in a concrete category
of the concrete class
"
Class {
	#name : #MethodsResponse,
	#superclass : #ClassInfoResponse,
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
MethodsResponse class >> id: anInteger class: aClass methods: anArray [
            ^(AggregatedResponseDecorator on: (self id: anInteger class: aClass))
                itemsAt: 'method' put: anArray;
                yourself

]

{ #category : #private }
MethodsResponse >> type [
            ^'Methods'

]
