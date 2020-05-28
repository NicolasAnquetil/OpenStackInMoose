Class {
	#name : #FamixOpenstackResource,
	#superclass : #FamixOpenstackComplexEntity,
	#instVars : [
		'#status => FMProperty',
		'#abstract => FMProperty',
		'#attributes => FMMany type: #FamixOpenstackProperty opposite: #parentEntity'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackResource class >> annotation [

	<FMClass: #Resource super: #FamixOpenstackComplexEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackResource >> abstract [

	<FMProperty: #abstract type: #Boolean>
	<generated>
	<FMComment: 'Whether the resource can be instanciated or not'>
	^ abstract
]

{ #category : #accessing }
FamixOpenstackResource >> abstract: anObject [
	<generated>
	abstract := anObject
]

{ #category : #adding }
FamixOpenstackResource >> addAttribute: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #accessing }
FamixOpenstackResource >> attributes [
	"Relation named: #attributes type: #FamixOpenstackProperty opposite: #parentEntity"

	<generated>
	<FMComment: 'All the Attributes of the Resource'>
	<derived>
	^ attributes
]

{ #category : #accessing }
FamixOpenstackResource >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #accessing }
FamixOpenstackResource >> status [

	<FMProperty: #status type: #String>
	<generated>
	<FMComment: 'Three possible statuses for Resources: #supported, #unsupported, #deprecated'>
	^ status
]

{ #category : #accessing }
FamixOpenstackResource >> status: anObject [
	<generated>
	status := anObject
]
