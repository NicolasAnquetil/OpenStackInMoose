Class {
	#name : #FamixOpenstackService,
	#superclass : #FamixOpenstackHotEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#instVars : [
		'#subServices => FMMany type: #FamixOpenstackService opposite: #parentService',
		'#parentService => FMOne type: #FamixOpenstackService opposite: #subServices',
		'#resourceTypes => FMMany type: #FamixOpenstackResourceType opposite: #parentService'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackService class >> annotation [

	<FMClass: #Service super: #FamixOpenstackHotEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixOpenstackService >> addResourceType: anObject [
	<generated>
	^ self resourceTypes add: anObject
]

{ #category : #adding }
FamixOpenstackService >> addSubService: anObject [
	<generated>
	^ self subServices add: anObject
]

{ #category : #accessing }
FamixOpenstackService >> parentService [
	"Relation named: #parentService type: #FamixOpenstackService opposite: #subServices"

	<generated>
	<container>
	^ parentService
]

{ #category : #accessing }
FamixOpenstackService >> parentService: anObject [

	<generated>
	parentService := anObject
]

{ #category : #navigation }
FamixOpenstackService >> parentServiceGroup [
	<generated>
	<navigation: 'ParentService'>
	^ MooseGroup with: self parentService
]

{ #category : #accessing }
FamixOpenstackService >> resourceTypes [
	"Relation named: #resourceTypes type: #FamixOpenstackResourceType opposite: #parentService"

	<generated>
	<derived>
	^ resourceTypes
]

{ #category : #accessing }
FamixOpenstackService >> resourceTypes: anObject [

	<generated>
	resourceTypes value: anObject
]

{ #category : #navigation }
FamixOpenstackService >> resourceTypesGroup [
	<generated>
	<navigation: 'ResourceTypes'>
	^ MooseGroup withAll: self resourceTypes asSet
]

{ #category : #accessing }
FamixOpenstackService >> subServices [
	"Relation named: #subServices type: #FamixOpenstackService opposite: #parentService"

	<generated>
	<derived>
	^ subServices
]

{ #category : #accessing }
FamixOpenstackService >> subServices: anObject [

	<generated>
	subServices value: anObject
]

{ #category : #navigation }
FamixOpenstackService >> subServicesGroup [
	<generated>
	<navigation: 'SubServices'>
	^ MooseGroup withAll: self subServices asSet
]
