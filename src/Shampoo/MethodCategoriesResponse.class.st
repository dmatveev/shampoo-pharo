"
My instances hold a lists of method categories of a concrete class
"
Class {
	#name : #MethodCategoriesResponse,
	#superclass : #ClassInfoResponse,
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
MethodCategoriesResponse class >> id: anInteger class: aClass categories: anArray [
            ^(AggregatedResponseDecorator on: (self id: anInteger class: aClass))
                itemsAt: 'category' put: anArray;
                yourself

]

{ #category : #private }
MethodCategoriesResponse >> type [
            ^'Categories'

]
