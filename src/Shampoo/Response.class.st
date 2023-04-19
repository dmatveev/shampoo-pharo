"
I am an abstract class. My subclasses represent various types
of responses and hold all the required information. They also know how to
serialize themselves into a network-transfer-friendly format.
"
Class {
	#name : #Response,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
Response class >> id: anInteger [
            ^(self new)
                id: anInteger;
                yourself

]

{ #category : #marshalling }
Response >> asXML [
            ^(ShampooXMLNode tagname: 'response')
                addAttribute: 'id' value: id asString;
                addAttribute: 'type' value: self type;
                yourself

]

{ #category : #'*Shampoo-Tests' }
Response >> id [
            ^id

]

{ #category : #private }
Response >> id: anInteger [
            id := anInteger

]

{ #category : #private }
Response >> type [
            ^self shouldNotImplement

]
