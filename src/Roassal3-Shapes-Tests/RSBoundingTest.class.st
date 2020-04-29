"
Test for all shapes with a matrix an one encompassing rectangle
"
Class {
	#name : #RSBoundingTest,
	#superclass : #RSCanvasTest,
	#category : #'Roassal3-Shapes-Tests'
}

{ #category : #running }
RSBoundingTest >> testDrawBitmap [
	canvas addShape: (RSBitmap new
		form: (ColorForm extent: 100@100 depth: 32)).
	canvas createMorph drawOnMockCanvas.
]

{ #category : #running }
RSBoundingTest >> testDrawBorder [
	canvas addShape: (RSEllipse new
		radius: 100;
		withBorder;
		yourself).
	canvas createMorph drawOnMockCanvas.
]

{ #category : #running }
RSBoundingTest >> testDrawBoxCornerRadius [
	canvas addShape: (RSBox new
		extent: 100@100;
		cornerRadius: 5;
		yourself).
	canvas createMorph drawOnMockCanvas.
]

{ #category : #running }
RSBoundingTest >> testDrawPolygon [
	canvas addShape: (RSPolygon new).
	canvas addShape: (RSPolygon new
		points: { 200@10. 250@190. 160@210 };
		yourself).
	canvas addShape: (RSPolygon new
		cornerRadii: 20;
		points: { 200@10. 250@190. 160@210 };
		yourself).
	self assert: canvas shapes second points equals: {(-5@ -100). (45@80). (-45@100)}.
	canvas createMorph drawOnMockCanvas.
]

{ #category : #running }
RSBoundingTest >> testDrawRing [
	| r |
	r := RSPieSlice new.
	"empty"
	canvas addShape: r.
	"circle"
	canvas addShape: (RSPieSlice new
		innerRadius: 0;
		externalRadius: 100;
		alphaAngle: 0;
		betaAngle: 360).
	"slice"
	canvas addShape: (RSPieSlice new
		externalRadius: 100;
		alphaAngle: 30;
		betaAngle: 90;
		segmentSpacing: 5).
	"donut"
	canvas addShape: (RSPieSlice new
		externalRadius: 100;
		innerRadius: 50;
		alphaAngle: 0;
		betaAngle: 360).
	"corner radii"
	canvas addShape: (RSPieSlice new
		externalRadius: 100;
		innerRadius: 50;
		alphaAngle: 0;
		betaAngle: 45;
		cornerRadii: 20).
	canvas createMorph drawOnMockCanvas.
]

{ #category : #running }
RSBoundingTest >> testDrawSVG [
	canvas addShape: (RSSVGPath new).
	canvas addShape: (RSSVGPath new
		svgPath: 'M 100 350 q 150 -300 300 0';
		yourself).
	canvas createMorph drawOnMockCanvas.
]

{ #category : #tests }
RSBoundingTest >> testFromRectangle [

	| box |
	box := RSBox new.
	self assert: box position equals: 0 @ 0.
	self assert: box extent equals: 0 @ 0.
	box fromRectangle: (10 @ 10 corner: 50 @ 40).
	self assert: box position equals: 30 @ 25.
	self assert: box extent equals: 40 @ 30.
	
	
]

{ #category : #tests }
RSBoundingTest >> testHasChildren [
	| b |
	b := RSBox new.
	self deny: b hasChildren.
	b := RSEllipse new.
	self deny: b hasChildren
]

{ #category : #tests }
RSBoundingTest >> testPosition [
	| b |
	b := RSBox new.
	self assert: b position equals: 0@0.
	b position: 0@0.
]