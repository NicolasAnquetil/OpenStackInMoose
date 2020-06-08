Class {
	#name : #FamixHOTSupportStatus,
	#superclass : #FamixHOTEntity,
	#instVars : [
		'#feature => FMOne type: #FamixHOTFeature opposite: #supportStatus',
		'#message => FMProperty',
		'#nextstatus => FMOne type: #FamixHOTSupportStatus opposite: #previousStatus',
		'#previousStatus => FMOne type: #FamixHOTSupportStatus opposite: #nextstatus',
		'#resourceType => FMOne type: #FamixHOTResourceType opposite: #supportStatus',
		'#status => FMProperty',
		'#version => FMProperty'
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
FamixHOTSupportStatus >> nextstatus [
	"Relation named: #nextstatus type: #FamixHOTSupportStatus opposite: #previousStatus"

	<generated>
	<derived>
	^ nextstatus
]

{ #category : #accessing }
FamixHOTSupportStatus >> nextstatus: anObject [

	<generated>
	nextstatus := anObject
]

{ #category : #accessing }
FamixHOTSupportStatus >> previousStatus [
	"Relation named: #previousStatus type: #FamixHOTSupportStatus opposite: #nextstatus"

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
