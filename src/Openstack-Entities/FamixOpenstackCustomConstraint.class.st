Class {
	#name : #FamixOpenstackCustomConstraint,
	#superclass : #FamixOpenstackConstraint,
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackCustomConstraint class >> annotation [

	<FMClass: #CustomConstraint super: #FamixOpenstackConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackCustomConstraint >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
FamixOpenstackCustomConstraint >> name: anObject [
	<generated>
	name := anObject
]
