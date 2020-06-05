Class {
	#name : #FamixOpenstackProperty,
	#superclass : #FamixOpenstackFeature,
	#instVars : [
		'#default => FMProperty',
		'#immutable => FMProperty',
		'#required => FMProperty',
		'#update_allowed => FMProperty',
		'#parentResource => FMOne type: #FamixOpenstackResourceType opposite: #properties'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackProperty class >> annotation [

	<FMClass: #Property super: #FamixOpenstackFeature>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackProperty >> default [

	<FMProperty: #default type: #Object>
	<generated>
	^ default
]

{ #category : #accessing }
FamixOpenstackProperty >> default: anObject [
	<generated>
	default := anObject
]

{ #category : #accessing }
FamixOpenstackProperty >> immutable [

	<FMProperty: #immutable type: #Boolean>
	<generated>
	^ immutable
]

{ #category : #accessing }
FamixOpenstackProperty >> immutable: anObject [
	<generated>
	immutable := anObject
]

{ #category : #accessing }
FamixOpenstackProperty >> parentResource [
	"Relation named: #parentResource type: #FamixOpenstackResourceType opposite: #properties"

	<generated>
	<container>
	^ parentResource
]

{ #category : #accessing }
FamixOpenstackProperty >> parentResource: anObject [

	<generated>
	parentResource := anObject
]

{ #category : #navigation }
FamixOpenstackProperty >> parentResourceGroup [
	<generated>
	<navigation: 'ParentResource'>
	^ MooseGroup with: self parentResource
]

{ #category : #accessing }
FamixOpenstackProperty >> required [

	<FMProperty: #required type: #Boolean>
	<generated>
	^ required
]

{ #category : #accessing }
FamixOpenstackProperty >> required: anObject [
	<generated>
	required := anObject
]

{ #category : #accessing }
FamixOpenstackProperty >> update_allowed [

	<FMProperty: #update_allowed type: #Boolean>
	<generated>
	^ update_allowed
]

{ #category : #accessing }
FamixOpenstackProperty >> update_allowed: anObject [
	<generated>
	update_allowed := anObject
]
