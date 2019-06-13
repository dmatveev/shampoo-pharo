"
My instances hold an output of a PrintIt request
"
Class {
	#name : #PrintItResponse,
	#superclass : #Response,
	#instVars : [
		'value'
	],
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
PrintItResponse class >> id: anInteger value: anObject [
            ^(self id: anInteger)
                value: anObject;
                yourself

]

{ #category : #marshalling }
PrintItResponse >> asXML [
            ^(super asXML)
                addNode: (ShampooXMLText text: value printString);
                yourself

]

{ #category : #private }
PrintItResponse >> type [
            ^'PrintIt'

]

{ #category : #accessors }
PrintItResponse >> value [
            ^value

]

{ #category : #private }
PrintItResponse >> value: anObject [
            value := anObject

]
