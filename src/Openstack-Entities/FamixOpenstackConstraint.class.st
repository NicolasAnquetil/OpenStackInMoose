Class {
	#name : #FamixOpenstackConstraint,
	#superclass : #FamixOpenstackHotEntity,
	#instVars : [
		'#description => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackConstraint class >> annotation [

	<FMClass: #Constraint super: #FamixOpenstackHotEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackConstraint >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : #accessing }
FamixOpenstackConstraint >> description: anObject [
	<generated>
	description := anObject
]
