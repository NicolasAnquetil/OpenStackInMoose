Class {
	#name : #FamixOpenstackResourceType,
	#superclass : #FamixOpenstackHotEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#description => FMProperty',
		'#abstract => FMProperty',
		'#parentService => FMOne type: #FamixOpenstackService opposite: #resourceTypes',
		'#attributes => FMMany type: #FamixOpenstackAttribute opposite: #parentResource',
		'#properties => FMMany type: #FamixOpenstackProperty opposite: #parentResource',
		'#supportStatus => FMMany type: #FamixOpenstackSupportStatus opposite: #resourceType'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackResourceType class >> annotation [

	<FMClass: #ResourceType super: #FamixOpenstackHotEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackResourceType >> abstract [

	<FMProperty: #abstract type: #Boolean>
	<generated>
	^ abstract
]

{ #category : #accessing }
FamixOpenstackResourceType >> abstract: anObject [
	<generated>
	abstract := anObject
]

{ #category : #adding }
FamixOpenstackResourceType >> addAttribute: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #adding }
FamixOpenstackResourceType >> addFeature: anObject [
	<generated>
	^ self features add: anObject
]

{ #category : #adding }
FamixOpenstackResourceType >> addProperty: anObject [
	<generated>
	^ self properties add: anObject
]

{ #category : #adding }
FamixOpenstackResourceType >> addSupportStatu: anObject [
	<generated>
	^ self supportStatus add: anObject
]

{ #category : #accessing }
FamixOpenstackResourceType >> attributes [
	"Relation named: #attributes type: #FamixOpenstackAttribute opposite: #parentResource"

	<generated>
	<derived>
	^ attributes
]

{ #category : #accessing }
FamixOpenstackResourceType >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #navigation }
FamixOpenstackResourceType >> attributesGroup [
	<generated>
	<navigation: 'Attributes'>
	^ MooseGroup withAll: self attributes asSet
]

{ #category : #accessing }
FamixOpenstackResourceType >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : #accessing }
FamixOpenstackResourceType >> description: anObject [
	<generated>
	description := anObject
]

{ #category : #accessing }
FamixOpenstackResourceType >> features [
	"Relation named: #features type: #FamixOpenstackFeature opposite: #entity"

	<generated>
	<derived>
	^ features
]

{ #category : #accessing }
FamixOpenstackResourceType >> features: anObject [

	<generated>
	features value: anObject
]

{ #category : #accessing }
FamixOpenstackResourceType >> parentService [
	"Relation named: #parentService type: #FamixOpenstackService opposite: #resourceTypes"

	<generated>
	<container>
	^ parentService
]

{ #category : #accessing }
FamixOpenstackResourceType >> parentService: anObject [

	<generated>
	parentService := anObject
]

{ #category : #navigation }
FamixOpenstackResourceType >> parentServiceGroup [
	<generated>
	<navigation: 'ParentService'>
	^ MooseGroup with: self parentService
]

{ #category : #accessing }
FamixOpenstackResourceType >> properties [
	"Relation named: #properties type: #FamixOpenstackProperty opposite: #parentResource"

	<generated>
	<derived>
	^ properties
]

{ #category : #accessing }
FamixOpenstackResourceType >> properties: anObject [

	<generated>
	properties value: anObject
]

{ #category : #navigation }
FamixOpenstackResourceType >> propertiesGroup [
	<generated>
	<navigation: 'Properties'>
	^ MooseGroup withAll: self properties asSet
]

{ #category : #accessing }
FamixOpenstackResourceType >> supportStatus [
	"Relation named: #supportStatus type: #FamixOpenstackSupportStatus opposite: #resourceType"

	<generated>
	<derived>
	^ supportStatus
]

{ #category : #accessing }
FamixOpenstackResourceType >> supportStatus: anObject [

	<generated>
	supportStatus value: anObject
]

{ #category : #navigation }
FamixOpenstackResourceType >> supportStatusGroup [
	<generated>
	<navigation: 'SupportStatus'>
	^ MooseGroup withAll: self supportStatus asSet
]
