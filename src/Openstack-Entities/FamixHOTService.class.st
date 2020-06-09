Class {
	#name : #FamixHOTService,
	#superclass : #FamixHOTEntity,
	#traits : 'FamixTNamedEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#parentService => FMOne type: #FamixHOTService opposite: #subServices',
		'#resourceTypes => FMMany type: #FamixHOTResourceType opposite: #parentService',
		'#subServices => FMMany type: #FamixHOTService opposite: #parentService'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTService class >> annotation [

	<FMClass: #Service super: #FamixHOTEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixHOTService >> addResourceType: anObject [
	<generated>
	^ self resourceTypes add: anObject
]

{ #category : #adding }
FamixHOTService >> addSubService: anObject [
	<generated>
	^ self subServices add: anObject
]

{ #category : #printing }
FamixHOTService >> mooseNameOn: aStream [
	self parentService
		ifNotNil: [ :parent |
			parent mooseNameOn: aStream.
			aStream nextPutAll: '::' ].
	self name ifNotNil: [ :n | aStream nextPutAll: n ]
]

{ #category : #accessing }
FamixHOTService >> parentService [
	"Relation named: #parentService type: #FamixHOTService opposite: #subServices"

	<generated>
	<container>
	^ parentService
]

{ #category : #accessing }
FamixHOTService >> parentService: anObject [

	<generated>
	parentService := anObject
]

{ #category : #navigation }
FamixHOTService >> parentServiceGroup [
	<generated>
	<navigation: 'ParentService'>
	^ MooseGroup with: self parentService
]

{ #category : #accessing }
FamixHOTService >> resourceTypes [
	"Relation named: #resourceTypes type: #FamixHOTResourceType opposite: #parentService"

	<generated>
	<derived>
	^ resourceTypes
]

{ #category : #accessing }
FamixHOTService >> resourceTypes: anObject [

	<generated>
	resourceTypes value: anObject
]

{ #category : #navigation }
FamixHOTService >> resourceTypesGroup [
	<generated>
	<navigation: 'ResourceTypes'>
	^ MooseGroup withAll: self resourceTypes asSet
]

{ #category : #accessing }
FamixHOTService >> subServices [
	"Relation named: #subServices type: #FamixHOTService opposite: #parentService"

	<generated>
	<derived>
	^ subServices
]

{ #category : #accessing }
FamixHOTService >> subServices: anObject [

	<generated>
	subServices value: anObject
]

{ #category : #navigation }
FamixHOTService >> subServicesGroup [
	<generated>
	<navigation: 'SubServices'>
	^ MooseGroup withAll: self subServices asSet
]
