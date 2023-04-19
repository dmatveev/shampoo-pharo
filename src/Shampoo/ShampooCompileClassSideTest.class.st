Class {
	#name : #ShampooCompileClassSideTest,
	#superclass : #ShampooTestCase,
	#instVars : [
		'classSide',
		'rside',
		'classSideResult'
	],
	#category : #'Shampoo-Tests'
}

{ #category : #'as yet unclassified' }
ShampooCompileClassSideTest >> classSideSample [
	^'<request id="80" type="CompileClass" namespace="ShampooSamples" class="SampleClassSide" side="class">
      <instvar>classOne</instvar>
      <instvar>classTwo</instvar>
      <instvar>classThree</instvar>
  </request>'

]

{ #category : #'as yet unclassified' }
ShampooCompileClassSideTest >> setUp [
	classSide := self requestFrom: self classSideSample.
            rside := classSide execute.
            classSideResult := SampleClassSide class

]

{ #category : #'as yet unclassified' }
ShampooCompileClassSideTest >> testClassInstVars [
	| vars |
            vars := classSideResult instVarNames asStringArray.
            self should: [vars includes: 'classOne'];
                 should: [vars includes: 'classTwo'];
                 should: [vars includes: 'classThree']

]
