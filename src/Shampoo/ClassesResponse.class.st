"
My instances represent a lists of classes in a concrete
namespace.
"
Class {
	#name : #ClassesResponse,
	#superclass : #Response,
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
ClassesResponse class >> id: anInteger names: anArray [
            ^(AggregatedResponseDecorator on: (self id: anInteger))
                itemsAt: 'class' put: anArray;
                yourself

]

{ #category : #private }
ClassesResponse >> type [
            ^'Classes'

]
