Class {
	#name : #FamixHOTResourceType,
	#superclass : #FamixHOTHotEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#description => FMProperty',
		'#abstract => FMProperty',
		'#parentService => FMOne type: #FamixHOTService opposite: #resourceTypes',
		'#attributes => FMMany type: #FamixHOTAttribute opposite: #parentResource',
		'#properties => FMMany type: #FamixHOTProperty opposite: #parentResource',
		'#supportStatus => FMMany type: #FamixHOTSupportStatus opposite: #resourceType',
		'#features => FMMany type: #FamixHOTFeature opposite: #entity'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTResourceType class >> annotation [

	<FMClass: #ResourceType super: #FamixHOTHotEntity>
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
FamixHOTResourceType >> addSupportStatu: anObject [
	<generated>
	^ self supportStatus add: anObject
]

{ #category : #accessing }
FamixHOTResourceType >> attributes [
	"Relation named: #attributes type: #FamixHOTAttribute opposite: #parentResource"

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
	"Relation named: #features type: #FamixHOTFeature opposite: #entity"

	<generated>
	<derived>
	^ features
]

{ #category : #accessing }
FamixHOTResourceType >> features: anObject [

	<generated>
	features value: anObject
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
	"Relation named: #properties type: #FamixHOTProperty opposite: #parentResource"

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