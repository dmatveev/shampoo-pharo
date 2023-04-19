Class {
	#name : #SampleClassB,
	#superclass : #Object,
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
SampleClassB >> aMethodWithoutCategory [
	^self class name

]

{ #category : #accessors }
SampleClassB >> bar [
                ^'Smalltalk is cool!'

]

{ #category : #'sample-category' }
SampleClassB >> doSomething [
                ^42

]

{ #category : #'sample-category' }
SampleClassB >> doSomethingElse: something withArg: anArg [
                ^something + anArg

]

{ #category : #accessors }
SampleClassB >> foo [
                ^1337

]
