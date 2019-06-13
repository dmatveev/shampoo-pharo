"
My instances hold information about a class and its state.
"
Class {
	#name : #ClassResponse,
	#superclass : #ClassInfoResponse,
	#category : #'Shampoo-Responses'
}

{ #category : #'instance creation' }
ClassResponse class >> id: anInteger class: aClass superclass: aSuperClass
                               instvars: anInstVars classvars: aClassVars poolvars: aPoolDicts [
            | obj |
            obj := self id: anInteger class: aClass attrs: {'superclass' -> aSuperClass}.
            ^(AggregatedResponseDecorator on: obj)
                itemsAt: 'instvar'  put: anInstVars;
                itemsAt: 'classvar' put: aClassVars;
                itemsAt: 'poolvar'  put: aPoolDicts;
                yourself

]

{ #category : #private }
ClassResponse >> type [
            ^'Class'

]
