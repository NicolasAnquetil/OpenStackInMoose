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
	model := FamixHOTModel new.

	package := self create: FamixHOTService named: 'OS'.
	package := (self create: FamixHOTService named: 'Neutron')
		parentService: package ;
		yourself.
		
	self createMeteringRuleIn: package.
	
	^model
]

{ #category : #running }
OSAbstractTest >> createMeteringLabel [
	| resource |
	resource := self create: FamixHOTResourceType named: 'MeteringLabel'.

	(self create: FamixHOTAttribute named: 'description')
		parentResource: resource.
	(self create: FamixHOTAttribute named: 'name')
		parentResource: resource.
	(self create: FamixHOTAttribute named: 'shared')
		parentResource: resource.

	(self create: FamixHOTProperty named: 'description')
		parentResource: resource ;
		required: false.
	(self create: FamixHOTProperty named: 'name')
		parentResource: resource ;
		required: false.
	(self create: FamixHOTProperty named: 'shared')
		parentResource: resource ;
		required: false.
		
	^resource 

]

{ #category : #running }
OSAbstractTest >> createMeteringRuleIn: package [
	| ruleResource prop labelResource |
	ruleResource := (self create: FamixHOTResourceType named: 'MeteringRule')
		parentService: package ;
		yourself.

	(self create: FamixHOTAttribute named: 'direction')
		parentResource: ruleResource.
	(self create: FamixHOTAttribute named: 'excluded')
		parentResource: ruleResource.
	(self create: FamixHOTAttribute named: 'metering_label_id')
		parentResource: ruleResource.
	(self create: FamixHOTAttribute named: 'remote_ip_prefix')
		parentResource: ruleResource.

	(self create: FamixHOTProperty named: 'direction')
		parentResource: ruleResource ;
		required: false.
	(self create: FamixHOTProperty named: 'excluded')
		parentResource: ruleResource ;
		required: false.

	labelResource := self createMeteringLabel
		parentService: package ;
		yourself.

	prop := (self create: FamixHOTProperty named: 'metering_label_id')
		parentResource: ruleResource ;
		entity: labelResource ;
		required: true ;
		yourself.
	prop := (self create: FamixHOTProperty named: 'remote_id_prefix')
		parentResource: ruleResource ;
		entity: labelResource ;
		required: true ;
		yourself.

	^ruleResource 

]

{ #category : #running }
OSAbstractTest >> setUp [
	self createExampleModel
]

{ #category : #tests }
OSAbstractTest >> testModelEntitiesCount [
	self assert: (model allWithType: FamixHOTService) size equals: 2.
	self assert: (model allWithType: FamixHOTResourceType) size equals: 2.
	self assert: (model allWithType: FamixHOTAttribute) size equals: 7.
	self assert: (model allWithType: FamixHOTProperty) size equals: 7.
]

{ #category : #tests }
OSAbstractTest >> testModelEntitiesOwnership [
	| entity |
	entity := model entityNamed: 'OS'.
	
	self assert: entity isNotNil.
	self assert: entity subServices size equals: 1.
	
	entity := entity subServices first.
	self assert: entity name equals: 'Neutron'.
	self assert: entity subServices size equals: 0.
	self assert: entity resourceTypes size equals: 2.
	

]

{ #category : #tests }
OSAbstractTest >> testModelEntitiesRelationship [
	| rule label prop |
	rule := model entityNamed: 'MeteringRule'.
	label := model entityNamed: 'MeteringLabel'.
	
	self assert: rule isNotNil.
	self assert: label isNotNil.
	
	prop := rule properties detect: [ :p | p name = 'metering_label_id' ].
	self assert: prop entity equals: label.
	self assert: (label features includes: prop).

	prop := rule properties detect: [ :p | p name = 'remote_id_prefix' ].
	self assert: prop entity equals: label.
	self assert: (label features includes: prop).

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
