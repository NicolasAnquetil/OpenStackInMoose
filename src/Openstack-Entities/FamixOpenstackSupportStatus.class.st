Class {
	#name : #FamixOpenstackSupportStatus,
	#superclass : #FamixOpenstackHotEntity,
	#instVars : [
		'#message => FMProperty',
		'#version => FMProperty',
		'#status => FMProperty',
		'#resourceType => FMOne type: #FamixOpenstackResourceType opposite: #supportStatus',
		'#previousStatus => FMOne type: #FamixOpenstackSupportStatus opposite: #nextstatus',
		'#nextstatus => FMOne type: #FamixOpenstackSupportStatus opposite: #previousStatus'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackSupportStatus class >> annotation [

	<FMClass: #SupportStatus super: #FamixOpenstackHotEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> message [

	<FMProperty: #message type: #String>
	<generated>
	^ message
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> message: anObject [
	<generated>
	message := anObject
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> nextstatus [
	"Relation named: #nextstatus type: #FamixOpenstackSupportStatus opposite: #previousStatus"

	<generated>
	<derived>
	^ nextstatus
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> nextstatus: anObject [

	<generated>
	nextstatus := anObject
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> previousStatus [
	"Relation named: #previousStatus type: #FamixOpenstackSupportStatus opposite: #nextstatus"

	<generated>
	^ previousStatus
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> previousStatus: anObject [

	<generated>
	previousStatus := anObject
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> resourceType [
	"Relation named: #resourceType type: #FamixOpenstackResourceType opposite: #supportStatus"

	<generated>
	<container>
	^ resourceType
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> resourceType: anObject [

	<generated>
	resourceType := anObject
]

{ #category : #navigation }
FamixOpenstackSupportStatus >> resourceTypeGroup [
	<generated>
	<navigation: 'ResourceType'>
	^ MooseGroup with: self resourceType
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> status [

	<FMProperty: #status type: #String>
	<generated>
	^ status
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> status: anObject [
	<generated>
	status := anObject
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> version [

	<FMProperty: #version type: #String>
	<generated>
	^ version
]

{ #category : #accessing }
FamixOpenstackSupportStatus >> version: anObject [
	<generated>
	version := anObject
]
