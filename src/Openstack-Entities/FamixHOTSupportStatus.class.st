Class {
	#name : #FamixHOTSupportStatus,
	#superclass : #FamixHOTEntity,
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#message => FMProperty',
		'#version => FMProperty',
		'#status => FMProperty',
		'#resourceType => FMOne type: #FamixHOTResourceType opposite: #supportStatus',
		'#previousStatus => FMOne type: #FamixHOTSupportStatus opposite: #nextStatus',
		'#nextStatus => FMOne type: #FamixHOTSupportStatus opposite: #previousStatus',
		'#feature => FMOne type: #FamixHOTFeature opposite: #supportStatus'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTSupportStatus class >> annotation [

	<FMClass: #SupportStatus super: #FamixHOTEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTSupportStatus >> feature [
	"Relation named: #feature type: #FamixHOTFeature opposite: #supportStatus"

	<generated>
	<derived>
	^ feature
]

{ #category : #accessing }
FamixHOTSupportStatus >> feature: anObject [

	<generated>
	feature := anObject
]

{ #category : #accessing }
FamixHOTSupportStatus >> message [

	<FMProperty: #message type: #String>
	<generated>
	^ message
]

{ #category : #accessing }
FamixHOTSupportStatus >> message: anObject [
	<generated>
	message := anObject
]

{ #category : #accessing }
FamixHOTSupportStatus >> nextStatus [
	"Relation named: #nextStatus type: #FamixHOTSupportStatus opposite: #previousStatus"

	<generated>
	<derived>
	^ nextStatus
]

{ #category : #accessing }
FamixHOTSupportStatus >> nextStatus: anObject [

	<generated>
	nextStatus := anObject
]

{ #category : #accessing }
FamixHOTSupportStatus >> previousStatus [
	"Relation named: #previousStatus type: #FamixHOTSupportStatus opposite: #nextStatus"

	<generated>
	^ previousStatus
]

{ #category : #accessing }
FamixHOTSupportStatus >> previousStatus: anObject [

	<generated>
	previousStatus := anObject
]

{ #category : #accessing }
FamixHOTSupportStatus >> resourceType [
	"Relation named: #resourceType type: #FamixHOTResourceType opposite: #supportStatus"

	<generated>
	<container>
	^ resourceType
]

{ #category : #accessing }
FamixHOTSupportStatus >> resourceType: anObject [

	<generated>
	resourceType := anObject
]

{ #category : #navigation }
FamixHOTSupportStatus >> resourceTypeGroup [
	<generated>
	<navigation: 'ResourceType'>
	^ MooseGroup with: self resourceType
]

{ #category : #accessing }
FamixHOTSupportStatus >> status [

	<FMProperty: #status type: #String>
	<generated>
	^ status
]

{ #category : #accessing }
FamixHOTSupportStatus >> status: anObject [
	<generated>
	status := anObject
]

{ #category : #accessing }
FamixHOTSupportStatus >> version [

	<FMProperty: #version type: #String>
	<generated>
	^ version
]

{ #category : #accessing }
FamixHOTSupportStatus >> version: anObject [
	<generated>
	version := anObject
]
