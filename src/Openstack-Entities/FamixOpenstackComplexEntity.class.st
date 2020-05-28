Class {
	#name : #FamixOpenstackComplexEntity,
	#superclass : #FamixOpenstackOpenStackEntity,
	#instVars : [
		'#parentPackage => FMOne type: #FamixOpenstackPackage opposite: #childrenEntities',
		'#properties => FMMany type: #FamixOpenstackProperty opposite: #parentEntity',
		'#referringFunctionalities => FMMany type: #FamixOpenstackFonctionality opposite: #referredEntity'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackComplexEntity class >> annotation [

	<FMClass: #ComplexEntity super: #FamixOpenstackOpenStackEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixOpenstackComplexEntity >> addProperty: anObject [
	<generated>
	^ self properties add: anObject
]

{ #category : #adding }
FamixOpenstackComplexEntity >> addReferringFunctionality: anObject [
	<generated>
	^ self referringFunctionalities add: anObject
]

{ #category : #accessing }
FamixOpenstackComplexEntity >> parentPackage [
	"Relation named: #parentPackage type: #FamixOpenstackPackage opposite: #childrenEntities"

	<generated>
	<FMComment: 'Parent package owning this ComplexEntity'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
FamixOpenstackComplexEntity >> parentPackage: anObject [

	<generated>
	parentPackage := anObject
]

{ #category : #navigation }
FamixOpenstackComplexEntity >> parentPackageGroup [
	<generated>
	<navigation: 'ParentPackage'>
	^ MooseGroup with: self parentPackage
]

{ #category : #accessing }
FamixOpenstackComplexEntity >> properties [
	"Relation named: #properties type: #FamixOpenstackProperty opposite: #parentEntity"

	<generated>
	<FMComment: 'All the Properties of the Complexentity'>
	<derived>
	^ properties
]

{ #category : #accessing }
FamixOpenstackComplexEntity >> properties: anObject [

	<generated>
	properties value: anObject
]

{ #category : #accessing }
FamixOpenstackComplexEntity >> referringFunctionalities [
	"Relation named: #referringFunctionalities type: #FamixOpenstackFonctionality opposite: #referredEntity"

	<generated>
	<FMComment: 'All Attributes or Properties that refer to this ComplexEntity'>
	<derived>
	^ referringFunctionalities
]

{ #category : #accessing }
FamixOpenstackComplexEntity >> referringFunctionalities: anObject [

	<generated>
	referringFunctionalities value: anObject
]
