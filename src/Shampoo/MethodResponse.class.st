"
My instances hold a source code of a concrete method in a
concrete class
"
Class {
	#name : #MethodResponse,
	#superclass : #ClassInfoResponse,
	#instVars : [
		'methodName',
		'methodSource'
	],
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
MethodResponse class >> id: anInteger class: aClass method: aNameString source: aSourceString [
            ^(self id: anInteger class: aClass)
                method: aNameString methodSource: aSourceString;
                yourself

]

{ #category : #marshalling }
MethodResponse >> asXML [
            ^(super asXML)
                addAttribute: 'method' value: methodName;
                addNode: (ShampooXMLText text: methodSource);
                yourself

]

{ #category : #private }
MethodResponse >> method: aNameString methodSource: aSourceString [
            methodName := aNameString.
            methodSource := aSourceString

]

{ #category : #'*Shampoo-Tests' }
MethodResponse >> methodName [
            ^methodName

]

{ #category : #'*Shampoo-Tests' }
MethodResponse >> methodSource [
            ^methodSource

]

{ #category : #private }
MethodResponse >> type [
            ^'MethodSource'

]
