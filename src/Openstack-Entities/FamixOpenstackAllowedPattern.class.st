Class {
	#name : #FamixOpenstackAllowedPattern,
	#superclass : #FamixOpenstackConstraint,
	#instVars : [
		'#pattern => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackAllowedPattern class >> annotation [

	<FMClass: #AllowedPattern super: #FamixOpenstackConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackAllowedPattern >> pattern [

	<FMProperty: #pattern type: #String>
	<generated>
	^ pattern
]

{ #category : #accessing }
FamixOpenstackAllowedPattern >> pattern: anObject [
	<generated>
	pattern := anObject
]
