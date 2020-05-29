Class {
	#name : #OSAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'OpenStack-tests'
}

{ #category : #running }
OSAbstractTest >> create: aClass named: aString [
	^aClass new
		name: aString ;
		mooseModel: model ;
		yourself.
]

{ #category : #running }
OSAbstractTest >> createExampleModel [
	| package |
	model := FamixOpenstackModel new.

	package := self create: FamixOpenstackPackage named: 'OS'.
	package := (self create: FamixOpenstackPackage named: 'Neutron')
		parentPackage: package ;
		yourself.
		
	self createMeteringRuleIn: package.
	
	^model
]

{ #category : #running }
OSAbstractTest >> createMeteringLabel [
	| resource |
	resource := self create: FamixOpenstackResource named: 'MeteringLabel'.

	(self create: FamixOpenstackAttribute named: 'description')
		parentEntity: resource.
	(self create: FamixOpenstackAttribute named: 'name')
		parentEntity: resource.
	(self create: FamixOpenstackAttribute named: 'shared')
		parentEntity: resource.

	(self create: FamixOpenstackProperty named: 'description')
		parentEntity: resource ;
		mandatory: false.
	(self create: FamixOpenstackProperty named: 'name')
		parentEntity: resource ;
		mandatory: false.
	(self create: FamixOpenstackProperty named: 'shared')
		parentEntity: resource ;
		mandatory: false.
		
	^resource 

]

{ #category : #running }
OSAbstractTest >> createMeteringRuleIn: package [
	| resource prop resource2 |
	resource := (self create: FamixOpenstackResource named: 'MeteringRule')
		parentPackage: package ;
		yourself.

	(self create: FamixOpenstackAttribute named: 'direction')
		parentEntity: resource.
	(self create: FamixOpenstackAttribute named: 'excluded')
		parentEntity: resource.
	(self create: FamixOpenstackAttribute named: 'metering_label_id')
		parentEntity: resource.
	(self create: FamixOpenstackAttribute named: 'remote_ip_prefix')
		parentEntity: resource.

	(self create: FamixOpenstackProperty named: 'direction')
		parentEntity: resource ;
		mandatory: false.
	(self create: FamixOpenstackProperty named: 'excluded')
		parentEntity: resource ;
		mandatory: false.

	resource2 := self createMeteringLabel
		parentPackage: package ;
		yourself.

	prop := (self create: FamixOpenstackProperty named: 'metering_label_id')
		parentEntity: resource ;
		referredEntity: resource2 ;
		mandatory: true ;
		yourself.
	prop := (self create: FamixOpenstackProperty named: 'remote_id_prefix')
		parentEntity: resource ;
		referredEntity: resource2 ;
		mandatory: true ;
		yourself.

	^resource 

]

{ #category : #running }
OSAbstractTest >> setUp [
	self createExampleModel
]

{ #category : #tests }
OSAbstractTest >> testModelEntitiesCount [
	self assert: (model allWithType: FamixOpenstackPackage) size equals: 2.
	self assert: (model allWithType: FamixOpenstackResource) size equals: 2.
	self assert: (model allWithType: FamixOpenstackMap) size equals: 0.
	self assert: (model allWithType: FamixOpenstackAttribute) size equals: 7.
	self assert: (model allWithType: FamixOpenstackProperty) size equals: 7.
]

{ #category : #tests }
OSAbstractTest >> testModelEntitiesOwnership [
	| entity |
	entity := model entityNamed: 'OS'.
	
	self assert: entity isNotNil.
	self assert: entity childrenPackages size equals: 1.
	
	entity := entity childrenPackages first.
	self assert: entity name equals: 'Neutron'.
	self assert: entity childrenPackages size equals: 0.
	self assert: entity childrenEntities size equals: 2.
	

]

{ #category : #tests }
OSAbstractTest >> testModelEntitiesRelationship [
	| rule label prop |
	rule := model entityNamed: 'MeteringRule'.
	label := model entityNamed: 'MeteringLabel'.
	
	self assert: rule isNotNil.
	self assert: label isNotNil.
	
	prop := rule properties detect: [ :p | p name = 'metering_label_id' ].
	self assert: prop referredEntity equals: label.
	self assert: (label referringFunctionalities includes: prop).

	prop := rule properties detect: [ :p | p name = 'remote_id_prefix' ].
	self assert: prop referredEntity equals: label.
	self assert: (label referringFunctionalities includes: prop).

]

{ #category : #tests }
OSAbstractTest >> testModelExport [
	| stream |
	stream := String streamContents: [ :st |
		model exportToMSEStream: st ].
	self assert: stream isString.
	self assert: stream lines notEmpty.
	self assert: stream first equals: $( .
	self assert: stream last equals: $).
]
