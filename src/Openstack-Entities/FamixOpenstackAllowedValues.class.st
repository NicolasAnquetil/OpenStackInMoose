Class {
	#name : #FamixOpenstackAllowedValues,
	#superclass : #FamixOpenstackConstraint,
	#instVars : [
		'#allowed => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackAllowedValues class >> annotation [

	<FMClass: #AllowedValues super: #FamixOpenstackConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackAllowedValues >> allowed [

	<FMProperty: #allowed type: #Object>
	<generated>
	<multivalued>
	^ allowed
]

{ #category : #accessing }
FamixOpenstackAllowedValues >> allowed: anObject [
	<generated>
	allowed := anObject
]
