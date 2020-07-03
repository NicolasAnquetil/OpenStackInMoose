Class {
	#name : #FamixHOTFeature,
	#superclass : #FamixHOTEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#description => FMProperty',
		'#type => FMProperty',
		'#supportStatus => FMOne type: #FamixHOTSupportStatus opposite: #feature',
		'#constraints => FMMany type: #FamixHOTConstraint opposite: #constrainedFeature',
		'#resourceType => FMOne type: #FamixHOTResourceType opposite: #referringFeatures',
		'#schemas => FMMany type: #FamixHOTProperty opposite: #parentFeature'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTFeature class >> annotation [

	<FMClass: #Feature super: #FamixHOTEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixHOTFeature >> addConstraint: anObject [
	<generated>
	^ self constraints add: anObject
]

{ #category : #adding }
FamixHOTFeature >> addSchema: anObject [
	<generated>
	^ self schemas add: anObject
]

{ #category : #accessing }
FamixHOTFeature >> constraints [
	"Relation named: #constraints type: #FamixHOTConstraint opposite: #constrainedFeature"

	<generated>
	<derived>
	^ constraints
]

{ #category : #accessing }
FamixHOTFeature >> constraints: anObject [

	<generated>
	constraints value: anObject
]

{ #category : #accessing }
FamixHOTFeature >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : #accessing }
FamixHOTFeature >> description: anObject [
	<generated>
	description := anObject
]

{ #category : #'query dependencies' }
FamixHOTFeature >> privateGetResourceTypeDependencies [
	"getting dependencies from the Feature to a ResourceType"
	| depFromSchemas |
	depFromSchemas := (self schemas
		flatCollect: [ :each |
			each privateGetResourceTypeDependencies
		]) asSet.
	self resourceType
		ifNotNil: [ :res | depFromSchemas
			add: (MooseQueryDependencyAssociation newFrom: self to: res) ].
	^depFromSchemas 

]

{ #category : #'query dependencies' }
FamixHOTFeature >> queryOutgoingDependencies [
	^self createOutgoingQueryResultWith:
		self privateGetResourceTypeDependencies
]

{ #category : #accessing }
FamixHOTFeature >> resourceType [
	"Relation named: #resourceType type: #FamixHOTResourceType opposite: #referringFeatures"

	<generated>
	^ resourceType
]

{ #category : #accessing }
FamixHOTFeature >> resourceType: anObject [

	<generated>
	resourceType := anObject
]

{ #category : #accessing }
FamixHOTFeature >> schemas [
	"Relation named: #schemas type: #FamixHOTProperty opposite: #parentFeature"

	<generated>
	<derived>
	^ schemas
]

{ #category : #accessing }
FamixHOTFeature >> schemas: anObject [

	<generated>
	schemas value: anObject
]

{ #category : #navigation }
FamixHOTFeature >> schemasGroup [
	<generated>
	<navigation: 'Schemas'>
	^ MooseGroup withAll: self schemas asSet
]

{ #category : #accessing }
FamixHOTFeature >> supportStatus [
	"Relation named: #supportStatus type: #FamixHOTSupportStatus opposite: #feature"

	<generated>
	^ supportStatus
]

{ #category : #accessing }
FamixHOTFeature >> supportStatus: anObject [

	<generated>
	supportStatus := anObject
]

{ #category : #accessing }
FamixHOTFeature >> type [

	<FMProperty: #type type: #String>
	<generated>
	^ type
]

{ #category : #accessing }
FamixHOTFeature >> type: anObject [
	<generated>
	type := anObject
]
