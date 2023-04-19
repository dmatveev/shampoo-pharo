Class {
	#name : #CompileShampooClassTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'compileClass',
		'r',
		'compiledClass'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
CompileShampooClassTest >> compileClassSample [
	^'<request id="80" type="CompileClass" superspace="Smalltalk" super="Object" namespace="ShampooSamples" class="SampleClassC">
      <instvar>one</instvar>
      <instvar>two</instvar>
      <instvar>three</instvar>
      <classvar>ClassOne</classvar>
      <classvar>ClassTwo</classvar>
      <classvar>ClassThree</classvar>
      <poolvar>poolOne</poolvar>
      <poolvar>poolTwo</poolvar>
      <poolvar>poolThree</poolvar>
  </request>'

]

{ #category : #'as yet unclassified' }
CompileShampooClassTest >> setUp [
	compileClass := self requestFrom: self compileClassSample.
            r := compileClass execute.
            compiledClass := SampleClassC.

]

{ #category : #'as yet unclassified' }
CompileShampooClassTest >> testClassvars [
	| vars |
            vars := compiledClass classVarNames asStringArray.
            self should: [vars includes: 'ClassOne'];
                 should: [vars includes: 'ClassTwo'];
                 should: [vars includes: 'ClassThree']

]

{ #category : #'as yet unclassified' }
CompileShampooClassTest >> testCompiledClass [
	self should: [compiledClass ~= nil]

]

{ #category : #'as yet unclassified' }
CompileShampooClassTest >> testInstvars [
	| vars |
            vars := compiledClass instVarNames asStringArray.
            self should: [vars includes: 'one'];
                 should: [vars includes: 'two'];
                 should: [vars includes: 'three']

]
