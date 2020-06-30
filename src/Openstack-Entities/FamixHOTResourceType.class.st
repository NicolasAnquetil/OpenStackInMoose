Class {
	#name : #FamixHOTResourceType,
	#superclass : #FamixHOTEntity,
	#traits : 'FamixTNamedEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#description => FMProperty',
		'#abstract => FMProperty',
		'#parentService => FMOne type: #FamixHOTService opposite: #resourceTypes',
		'#attributes => FMMany type: #FamixHOTAttribute opposite: #parentResourceType',
		'#properties => FMMany type: #FamixHOTProperty opposite: #parentResourceType',
		'#supportStatus => FMMany type: #FamixHOTSupportStatus opposite: #resourceType',
		'#subResourceType => FMMany type: #FamixHOTResourceType opposite: #superResourceType',
		'#superResourceType => FMOne type: #FamixHOTResourceType opposite: #subResourceType',
		'#referringFeatures => FMMany type: #FamixHOTFeature opposite: #resourceType'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTResourceType class >> annotation [

	<FMClass: #ResourceType super: #FamixHOTEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTResourceType >> abstract [

	<FMProperty: #abstract type: #Boolean>
	<generated>
	^ abstract
]

{ #category : #accessing }
FamixHOTResourceType >> abstract: anObject [
	<generated>
	abstract := anObject
]

{ #category : #adding }
FamixHOTResourceType >> addAttribute: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #adding }
FamixHOTResourceType >> addProperty: anObject [
	<generated>
	^ self properties add: anObject
]

{ #category : #adding }
FamixHOTResourceType >> addReferringFeature: anObject [
	<generated>
	^ self referringFeatures add: anObject
]

{ #category : #adding }
FamixHOTResourceType >> addSubResourceType: anObject [
	<generated>
	^ self subResourceType add: anObject
]

{ #category : #adding }
FamixHOTResourceType >> addSupportStatu: anObject [
	<generated>
	^ self supportStatus add: anObject
]

{ #category : #accessing }
FamixHOTResourceType >> attributes [
	"Relation named: #attributes type: #FamixHOTAttribute opposite: #parentResourceType"

	<generated>
	<derived>
	^ attributes
]

{ #category : #accessing }
FamixHOTResourceType >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #navigation }
FamixHOTResourceType >> attributesGroup [
	<generated>
	<navigation: 'Attributes'>
	^ MooseGroup withAll: self attributes asSet
]

{ #category : #accessing }
FamixHOTResourceType >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : #accessing }
FamixHOTResourceType >> description: anObject [
	<generated>
	description := anObject
]

{ #category : #printing }
FamixHOTResourceType >> mooseNameOn: aStream [
	self parentService
		ifNotNil: [ :parent |
			parent mooseNameOn: aStream.
			aStream nextPutAll: '::' ].
	self name ifNotNil: [ :n | aStream nextPutAll: n ]
]

{ #category : #accessing }
FamixHOTResourceType >> parentService [
	"Relation named: #parentService type: #FamixHOTService opposite: #resourceTypes"

	<generated>
	<container>
	^ parentService
]

{ #category : #accessing }
FamixHOTResourceType >> parentService: anObject [

	<generated>
	parentService := anObject
]

{ #category : #navigation }
FamixHOTResourceType >> parentServiceGroup [
	<generated>
	<navigation: 'ParentService'>
	^ MooseGroup with: self parentService
]

{ #category : #printing }
FamixHOTResourceType >> printOn: aStream [
	^aStream
		nextPutAll: '(R)' ;
		nextPutAll: self name ;
		yourself
]

{ #category : #'query dependencies' }
FamixHOTResourceType >> privateGetFeatureDependencies [
	^self referringFeatures
		collect: [ :f | MooseQueryDependencyAssociation newFrom: self to: f ].

]

{ #category : #accessing }
FamixHOTResourceType >> properties [
	"Relation named: #properties type: #FamixHOTProperty opposite: #parentResourceType"

	<generated>
	<derived>
	^ properties
]

{ #category : #accessing }
FamixHOTResourceType >> properties: anObject [

	<generated>
	properties value: anObject
]

{ #category : #navigation }
FamixHOTResourceType >> propertiesGroup [
	<generated>
	<navigation: 'Properties'>
	^ MooseGroup withAll: self properties asSet
]

{ #category : #'query dependencies' }
FamixHOTResourceType >> queryIncomingDependencies [
	| aCollection |
	aCollection := self queryLocalIncomingDependencies.

	self superResourceType ifNotNil: [ :sup |
		aCollection addAll: sup queryIncomingDependencies ].

	^ aCollection
]

{ #category : #'query dependencies' }
FamixHOTResourceType >> queryLocalIncomingDependencies [
	"computing dependencies 'manually' "

	^self createOutgoingQueryResultWith:
		self privateGetFeatureDependencies

]

{ #category : #'query dependencies' }
FamixHOTResourceType >> queryLocalOutgoingDependencies [
	"computing dependencies 'manually' "

	^self createOutgoingQueryResultWith:
		(self features flatCollect: #queryOutgoingDependencies)

]

{ #category : #'query dependencies' }
FamixHOTResourceType >> queryOutgoingDependencies [
	| aCollection |
	aCollection := self queryLocalOutgoingDependencies.

	self subResourceType do: [ :sub |
		aCollection addAll: sub queryOutgoingDependencies ].

	^ aCollection
]

{ #category : #accessing }
FamixHOTResourceType >> referringFeatures [
	"Relation named: #referringFeatures type: #FamixHOTFeature opposite: #resourceType"

	<generated>
	<derived>
	^ referringFeatures
]

{ #category : #accessing }
FamixHOTResourceType >> referringFeatures: anObject [

	<generated>
	referringFeatures value: anObject
]

{ #category : #accessing }
FamixHOTResourceType >> subResourceType [
	"Relation named: #subResourceType type: #FamixHOTResourceType opposite: #superResourceType"

	<generated>
	<derived>
	^ subResourceType
]

{ #category : #accessing }
FamixHOTResourceType >> subResourceType: anObject [

	<generated>
	subResourceType value: anObject
]

{ #category : #accessing }
FamixHOTResourceType >> superResourceType [
	"Relation named: #superResourceType type: #FamixHOTResourceType opposite: #subResourceType"

	<generated>
	^ superResourceType
]

{ #category : #accessing }
FamixHOTResourceType >> superResourceType: anObject [

	<generated>
	superResourceType := anObject
]

{ #category : #accessing }
FamixHOTResourceType >> supportStatus [
	"Relation named: #supportStatus type: #FamixHOTSupportStatus opposite: #resourceType"

	<generated>
	<derived>
	^ supportStatus
]

{ #category : #accessing }
FamixHOTResourceType >> supportStatus: anObject [

	<generated>
	supportStatus value: anObject
]

{ #category : #navigation }
FamixHOTResourceType >> supportStatusGroup [
	<generated>
	<navigation: 'SupportStatus'>
	^ MooseGroup withAll: self supportStatus asSet
]
