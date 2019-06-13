"
My instances represent a list of namespaces in the image
"
Class {
	#name : #NamespacesResponse,
	#superclass : #Response,
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
NamespacesResponse class >> id: anInteger names: anArray [
            ^(AggregatedResponseDecorator on: (self id: anInteger))
                itemsAt: 'namespace' put: anArray;
                yourself

]

{ #category : #private }
NamespacesResponse >> type [
            ^'Namespaces'

]
