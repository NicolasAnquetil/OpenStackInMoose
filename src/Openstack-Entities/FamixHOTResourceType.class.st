Class {
	#name : #FamixHOTResourceType,
	#superclass : #FamixHOTEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#abstract => FMProperty',
		'#attributes => FMMany type: #FamixHOTAttribute opposite: #parentResourceType',
		'#description => FMProperty',
		'#features => FMMany type: #FamixHOTFeature opposite: #resourceType',
		'#parentService => FMOne type: #FamixHOTService opposite: #resourceTypes',
		'#properties => FMMany type: #FamixHOTProperty opposite: #parentResourceType',
		'#subResourceType => FMMany type: #FamixHOTResourceType opposite: #superResourceType',
		'#superResourceType => FMOne type: #FamixHOTResourceType opposite: #subResourceType',
		'#supportStatus => FMMany type: #FamixHOTSupportStatus opposite: #resourceType'
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
FamixHOTResourceType >> addFeature: anObject [
	<generated>
	^ self features add: anObject
]

{ #category : #adding }
FamixHOTResourceType >> addProperty: anObject [
	<generated>
	^ self properties add: anObject
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

{ #category : #accessing }
FamixHOTResourceType >> features [
	"Relation named: #features type: #FamixHOTFeature opposite: #resourceType"

	<generated>
	<derived>
	^ features
]

{ #category : #accessing }
FamixHOTResourceType >> features: anObject [

	<generated>
	features value: anObject
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
