Class {
	#name : #FamixOpenstackPackage,
	#superclass : #FamixOpenstackOpenStackEntity,
	#instVars : [
		'#childrenPackages => FMMany type: #FamixOpenstackPackage opposite: #parentPackage',
		'#parentPackage => FMOne type: #FamixOpenstackPackage opposite: #childrenPackages',
		'#childrenEntities => FMMany type: #FamixOpenstackComplexEntity opposite: #parentPackage'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackPackage class >> annotation [

	<FMClass: #Package super: #FamixOpenstackOpenStackEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixOpenstackPackage >> addChildrenEntity: anObject [
	<generated>
	^ self childrenEntities add: anObject
]

{ #category : #adding }
FamixOpenstackPackage >> addChildrenPackage: anObject [
	<generated>
	^ self childrenPackages add: anObject
]

{ #category : #accessing }
FamixOpenstackPackage >> childrenEntities [
	"Relation named: #childrenEntities type: #FamixOpenstackComplexEntity opposite: #parentPackage"

	<generated>
	<FMComment: 'Children complexEntities contained in this package'>
	<derived>
	^ childrenEntities
]

{ #category : #accessing }
FamixOpenstackPackage >> childrenEntities: anObject [

	<generated>
	childrenEntities value: anObject
]

{ #category : #navigation }
FamixOpenstackPackage >> childrenEntitiesGroup [
	<generated>
	<navigation: 'ChildrenEntities'>
	^ MooseGroup withAll: self childrenEntities asSet
]

{ #category : #accessing }
FamixOpenstackPackage >> childrenPackages [
	"Relation named: #childrenPackages type: #FamixOpenstackPackage opposite: #parentPackage"

	<generated>
	<FMComment: 'Children packages contained in this package'>
	<derived>
	^ childrenPackages
]

{ #category : #accessing }
FamixOpenstackPackage >> childrenPackages: anObject [

	<generated>
	childrenPackages value: anObject
]

{ #category : #navigation }
FamixOpenstackPackage >> childrenPackagesGroup [
	<generated>
	<navigation: 'ChildrenPackages'>
	^ MooseGroup withAll: self childrenPackages asSet
]

{ #category : #accessing }
FamixOpenstackPackage >> parentPackage [
	"Relation named: #parentPackage type: #FamixOpenstackPackage opposite: #childrenPackages"

	<generated>
	<FMComment: 'Parent package owning this Package'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
FamixOpenstackPackage >> parentPackage: anObject [

	<generated>
	parentPackage := anObject
]

{ #category : #navigation }
FamixOpenstackPackage >> parentPackageGroup [
	<generated>
	<navigation: 'ParentPackage'>
	^ MooseGroup with: self parentPackage
]
