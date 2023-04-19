"
I am a decorator, a Smalltalk alternative to the multiple
inheritance. My instances are used to add some additional state and behavior
dynamically to the existing objects. The additions introduced by me could not
be added somewhere in the root of the class (sub)hierarchy, some classes in
the hierarchy should behave like me, and some should not. That's why I am
here.
"
Class {
	#name : #AggregatedResponseDecorator,
	#superclass : #Object,
	#instVars : [
		'items',
		'wrapped'
	],
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
AggregatedResponseDecorator class >> on: aWrappedObject [
            ^self new on: aWrappedObject

]

{ #category : #marshalling }
AggregatedResponseDecorator >> asXML [
            | root |
            root := wrapped asXML.

            self items keysAndValuesDo:
                [:key :values | values do: [:each |
                root addNode: ((ShampooXMLNode tagname: key asString)
                                   addNode: (ShampooXMLText text: each);
                                   yourself)]].

            ^root

]

{ #category : #decorating }
AggregatedResponseDecorator >> doesNotUnderstand: aMessage [
            "Proxy an unknown message to an underlying object"
            ^wrapped perform: aMessage selector
                     withArguments: aMessage arguments

]

{ #category : #accessors }
AggregatedResponseDecorator >> items [
            ^items ifNil: [items := Dictionary new]

]

{ #category : #accessors }
AggregatedResponseDecorator >> itemsAt: itemTypeString put: anArray [
            self items at: itemTypeString put: anArray copy

]

{ #category : #private }
AggregatedResponseDecorator >> on: aWrappedObject [
            wrapped := aWrappedObject

]
