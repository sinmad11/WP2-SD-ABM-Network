extensions [ nw ls]

turtles-own [adopted?] ;; property related to adoption


to set-up
  ca
system-dynamics-setup

 ;;   nw generator-random turtles number-hemp-farmers

  ;; create the agents based on the slider
  crt number-hemp-farmers [

  ;; adoption property needs to be initialised in the setup
    set adopted? false

  ;; seperate the turtles spatially
    setxy random-xcor random-ycor

    ;; consistant appearance
    set color red
    set shape "person"

  ]
  ;; create a network of agents
  ask turtles [
    create-link-with one-of other turtles
  ]
  ;; dont create a link with a turtle that you already have as a member of link neighbours

  reset-ticks

end

to go

 system-dynamics-go
  set-current-plot "populations"
   system-dynamics-do-plot ;;"" ""



  ;; stop the model if no one left to adopt
  if ( not any? turtles with [ not adopted? ] ) [
    stop
  ]


  ;; ask the turtles to adopt or not adopt randomly
  ask turtles with [ not adopted? ] [
   adopt
  ]

  tick
end

   ; reset the diffusion without destroying the network
to reset-diffusion
  ask turtles [
  set adopted? false
  set color white
  ]

  clear-all-plots

end

;; this procedure will determine whether or not to adopt
to adopt


  ;; adopt based on policy change
  if random-float 1.0 < policy-change [
    set adopted? true
    set color green
  ]

  ;; adopt based on availibility of processing facilities
  let neighbours-adopted link-neighbors with [ adopted? ]
  let total-neighbours link-neighbors
  if not adopted? and random-float 1.0 <
  ( processing-facilities * ( count neighbours-adopted / count total-neighbours ) ) [
    set adopted? true
    set color blue
  ]

end
@#$#@#$#@
GRAPHICS-WINDOW
210
45
578
414
-1
-1
10.91
1
10
1
1
1
0
0
0
1
-16
16
-16
16
0
0
1
ticks
30.0

SLIDER
15
45
188
78
number-hemp-farmers
number-hemp-farmers
0
500
136.0
1
1
NIL
HORIZONTAL

BUTTON
15
170
84
203
NIL
set-up
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
95
170
158
203
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
15
85
187
118
policy-change
policy-change
0
1.0
0.1
0.05
1
NIL
HORIZONTAL

SLIDER
15
130
190
163
processing-facilities
processing-facilities
0
1.0
0.05
0.05
1
NIL
HORIZONTAL

PLOT
5
265
205
415
adoptions over time
Years
Adoptions
0.0
30.0
0.0
30.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot count turtles with [ adopted? ]"

BUTTON
20
210
155
243
reset-diffusion
NIL
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
590
175
657
208
set-up
set-up
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
665
175
728
208
go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
590
105
715
150
NIL
adopters
1
1
11

PLOT
585
265
785
415
populations
Years
Potential Adopters/ Adopters
0.0
30.0
0.0
30.0
true
false
"" ""
PENS
"pen-1" 1.0 0 -7500403 true "" "plot potential-adopters"
"pen-2" 1.0 0 -15302303 true "" "plot adopters"

MONITOR
590
45
722
90
NIL
potential-adopters
1
1
11

TEXTBOX
20
15
170
33
Agent Based Model
11
0.0
1

TEXTBOX
595
15
745
33
System Dynamics Model
11
0.0
1

TEXTBOX
20
425
170
443
NIL
11
0.0
1

TEXTBOX
370
15
520
33
Network
11
0.0
1

@#$#@#$#@
# WHAT IS IT?


## The Hemp in Agriculture for Carbon Sequestration (HACS) Model

The Hemp in Agriculture for Carbon Sequestration (HACS) Model is an integrated adaption of the "Bass" System Dynamics (SD) and "Rogers" Agent Based model (ABM) of the diffusion of innovation to explore the drivers and barriers effecting industrial hemp cultivation in Ireland. The model is designed to explore the effects of Irish farmers' decisions to apply for licenses to cultivate Hemp Sativa. The model acts as a visualisation tool for stakeholders and decision makers to represent the diffusion of landowners in applying for a licence to cultivate Hemp in Ireland.

The HACS model addresses which conditions would have to change and at what rate for Irish landowners to adapt faster to cultivating Hemp Sativa, which could aid in the legally binding 0\% carbon emissions for agriculture in Ireland by 2050? 

## ABM

The ABM explores the rate of diffusion of landowner's decisions to apply for licences to cultivate Hemp Sativa through the use of Behaviour over Time Graphs. The ABM tests the determinants behind the landowner's decision to obtaine a licence based on the availability of processing facilities and the loosening of strict regulations from policymakers. 


## SD MODEL

In the SD extension the variables word-of-mouth and ad-effectiveness relate to policy change and processing facilities sliders in the agent based model interface. 



# HOW IT WORKS

The rate of speed of farmers to decide weather to apply for a licence to cultivate industrial based on hemp licences is been modeled.

In the SD extension the variables word-of-mouth and ad-effectiveness relate to policy change and processing facilities sliders in the agent based model interface.

Experiments: Identify impacts on rate of spread of Industrial hemp licence applications if strict restrictions were lifted and processing facilities available.


## Model Scope

The model explores the decision of Farmers to apply for a license to cultivate industrial hemp in Ireland.
Spacial scope, Ireland (GIS shapefile could be used in future)
Temporal Scope: Annual 1 year from 2016-2066 50 years (maybe)
Available data on number of hemp licenses issued and hectares cultivated since 2016 to Oct of each subsequent year.

## Available Data

Year	Licences issued	and Land used h/a
2016	7	
2017	16	76
2018	24	230
2019	74	547
2020	94	362
2021	76	251
2022    55      163

Data can be used either using number of licences issued or number of hectares cultivated. (Future Work GIS)

2019 Land Use & Hectares (ha)} & Percentage
Total Land & 6,900,000 & 100% 
Agriculture & 4,440,000 & 64%
Forestry & 770,020 & 11%
Unsuitable for Agri & 1,689,980 & 25%
Industrial Hemp & 547 & 0.0079%

Possible sequestration from hemp in cultivation in Ireland (for SD Model) (Future Work)

Year	sgl @ 10t dbl @ 10t	sgl @15t dbl @15t sgl @22t dbl @22t
2017	760	1,520	1,140	2,280	1,672	3,344
2018	2,300	4,600	3,450	6,900	5,060	10,120
2019	5,470	10,940	8,205	16,410	12,034	24,068
2020	3,620	7,240	5,430	10,860	7,964	15,928
2021	2,510	5,020	3,765	7,530	5,522	11,044


Legal instruments related to industrial hemp in Europe & Regulations in Ireland affecting the hemp industry

1: Regulation (EU) 1307/2013 establishing rules for direct payments to farmers under support schemes within the common agricultural policy.

2: Regulation (EU) 1308/2013 establishing a common organisation of the markets in agricultural products.

3: Commission Delegated Regulation (EU) 639/2014 establishing the requirement to use certified seed of varieties listed in the ‘Common Catalogue of Varieties of Agricultural Plant Species’

4: Commission Implementing Regulation (EU) 809/2014 establishing specific control measures and methods for determining tetrahydrocannabinol levels in hemp.

5: Commission Delegated Regulation (EU) 2016/1237 and EU Implementing Regulation 2016/1239 establishing the import licence rules for hemp.

6: Commission Implementing  Regulation (EU) 2016/1239 laying down rules for the application of EU Regulation 1308/2013 of the European Parliament and the Council about the system of import and export licences.

7: Commission Regulation (EU) 2022/1393 on the maximum levels of delta-9- tetrahydrocannabinol in hemp seeds and products derived therefrom.

8: Commission Implementing Regulation (EU) 2022/1173 on the integrated administration and control system in the common agricultural policy.

9: Council Directive 2002/53/EC on the common catalogue of varieties of agricultural plant species.

10: Council Directive 2002/57/EC on the seed marketing of oil and fibre plants.

11: Council Decision 2003/17/EC on the equivalence of field inspections carried out in third countries on seed-producing crops and the equivalence of seed produced in third countries.




## Agent Selection 

Individual farmers from the farming community and government policy makers.
Proto agent: Network connections, availability of processing facilities, political will to relaxt strict regulations from relevent government departments.

Principal types of agents involved in this phenomenon.

Turtles-Farming community, that have land to cultivat Industrial Hemp.
Policy makers can change strict regulations to apply for licenses to cultivate hemp and provide access to processing facilities.
Links- links between farmers -farming community, policy makers.(not sure whether to leave this in)
Observer- Make changes when necessary.

## Agents properties 

Farming community - have access to land, and have legally binding obligation to reduce carbon emissions from agriculture by 2050 with carbon tax implications and can make decision to apply for Industrial Hemp license to cultivate industrial hemp or not.
Effects of strict regulations, effects of availability of processing facilities.
Policy makers - can change strict legal regulations allowing farming community easier access to licence application procedures and access to processing facilities
Links - will not have separate properties now but could in the future.
Observer- Make changes when necessary.

## Agent behaviours 

Framing community - decide to adopt the information or not.
Policy makers – decide to lift strict regulations or not, decide to provide access to processing faciities.
Observer – makes changes as required.

## Agents envvironment 

The Social Network
To some extent government policy
Available agricultural land in Ireland

## At each time step

Each agent decides whether to adopt to cultivating industrial hemp. They update their internal state. Overall statistics are calculated and reported.

## Model inputs parameters 

Diffusion, The network structure, Effect of Policy Influence, Effect of available processing facilities. Number of Agents.

## Model outputs.

Diffusion, Number of adoptions over time



# HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

The growth-rate-slider is set from 0 to 100%
The number-of-hemp-farmers slider is set from 0 to 100 farmers
The processing-facilities slider is set from 0 to 100%


# THINGS TO NOTICE

## State Variables and Scales

The Hemp in Agriculture for Carbon Sequestration (HACS) model includes two types of entities, landowners, and policymakers. The key attributes of the agents are 

1) landowners and can decide to apply for a licence to cultivate Hemp Sativa or not.  
2) Policymakers can ease or restrict application rules. 

Proto agent, availability of processing facilities, changes in regulations by government decision-makers. 

The temporal scope of the model is 30 years. 

The simulation will run from 2020 until 2050 in line with Ireland's legally binding commitment to achieving 0\% carbon emissions from agriculture by 2050. 

One time step or each tick represents a single year in the model as landowners can only apply for licences annually. 


## Process Overview and Scheduling

The most critical processes of the model, which are repeated every time step, are the landowner's decision to apply for a licence or not. Decision Makers choose whether to lift or maintain strict regulations and the availability of processing facilities close to the home farm. 

Each landowner asks itself, "will I apply for a licence to cultivate Hemp? If yes, then the number adds to the population of the location county and is represented using scaling colour green from light to dark where counties have more licences issued. (For future work using GIS). Each landowner asks itself" "will I apply for a licence to cultivate Hemp? If no, then no change on shapefile counties data set.
 
Policymakers can decide to ease regulations if eased increase in hemp farming population, if left no change business as usual scenario.  

Processing facilities are either more widely available or not accessed from a slider on the interface from 1 to 100 per cent figure 3 shows process overview and scheduling process map.

Adaption rate of landowners in the HACS model choose to apply for a licence to cultivate Hemp Sativa in response to changing external conditions such as policy changes or availability of processing facilities close to the home farm.  

Experiments identify impacts on the rate of spread of Hemp Sativa licence applications if strict restrictions were lifted and processing facilities available.

Model dynamics are driven by input data representing the number of licences issued by the HPRA concerning cultivation Hemp. 

## Implementation, Execution and Verification

NetLogo 6.2.0 software used. 

## Model Implementation and sample Interface 

Following good modelling practice an iterative process of testing and policy analysis will be undertaken with full code available for replication and full Overview Design concepts and Details ODD provided.

The Work in Progress introduces the Hemp in Agriculture for Carbon Sequestration (HACS) model. The model when developed will demonstrate as an illustration for exploration purposes and will aid in the discovery behind the determinants behind landowners’ decisions to apply for a licence to cultivate Hemp Sativa in Ireland. 

# THINGS TO TRY

Moving the sliders to assertain different results.

# EXTENDING THE MODEL

## GIS

Code %extensions [gis]
%globals [Counties___OSi_National_Statutory_Boundaries_.shp]
%patches-own [countes - name confirmed issued licences]
%gis:load-dataset [Counties___OSi_National_Statutory_Boundaries_.shp]
%gis:srt-world-envelope gis:envelope-of Counties___OSi_National_Statutory_Boundaries_.shp
%to setup-gis
  gis:apply-coverage [Counties___OSi_National_Statutory_Boundaries_.shp}

## HOW IT WORKS
This model loads four different GIS datasets: a point file of world cities, a polyline file of world rivers, a polygon file of countries, and a raster file of surface elevation. It provides a collection of different ways to draw the data to the drawing layer, run queries on it, and transform it into NetLogo Turtles or Patch data.

## HOW TO USE IT
Select a map projection from the projection menu, then click the setup button. You can then use all other features of the mode. See the code tab for specific information about how the different buttons work.

## THINGS TO TRY
Most of the commands in the Code tab can be easily modified to display slightly different information. For example, you could modify highlight-large-cities to highlight small cities instead, by replacing gis:find-greater-than with gis:find-less-than.

## EXTENDING THE MODEL
This model doesn’t do anything particularly interesting, but you can easily copy some of the code from the Code tab into a new model that uses your own data, or does something interesting with the included data. See the other GIS code example, GIS Gradient Example, for an example of this technique.

## RELATED MODELS
GIS Gradient Example provides another example of how to use the GIS extension.
 
# Extending the model using the extension System Dynamics Modeler.

## HOW IT WORKS

At each step, the value of INFLOW is added to STOCK. The value of INFLOW is always the previous value of STOCK times a specified growth rate.

## HOW TO USE IT
Press the SETUP button, then press the GO button to run the model.

## THINGS TO NOTICE
View the STOCK monitor to see the current value of STOCK.

View the plot to observe the growth of STOCK over time.

## THINGS TO TRY
Use the System Dynamics Modeler to add an outflow.

Try different growth-rate values.

## EXTENDING THE MODEL
Create a new stock that grows linearly. Try having the level of one stock influence the growth rate of the other.

## NETLOGO FEATURES
This model uses the System Dynamics Modeler.

# RELATED MODELS
System Dynamics -> Logistic Growth

# HOW TO CITE
If you mention this model or the NetLogo software in a publication, we ask that you include the citations below. For the model itself:

Wilensky, U. (2005). NetLogo Exponential Growth model. http://ccl.northwestern.edu/netlogo/models/ExponentialGrowth. Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.
Please cite the NetLogo software as:

Wilensky, U. (1999). NetLogo. http://ccl.northwestern.edu/netlogo/. Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.

# NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

# RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

# CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.2.2
@#$#@#$#@
@#$#@#$#@
1.0
    org.nlogo.sdm.gui.AggregateDrawing 18
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 440 277 50 50
            org.nlogo.sdm.gui.WrappedConverter "100" "contact-rate"
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 112 136 30 30
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 464 154 60 40
            org.nlogo.sdm.gui.WrappedStock "adopters" "0" 0
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 304 279 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.015" "adoption-fraction"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 136 226 50 50
            org.nlogo.sdm.gui.WrappedConverter "ad-effectiveness * potential-adopters" "adoption-from-ad"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 378 226 50 50
            org.nlogo.sdm.gui.WrappedConverter "contact-rate * adoption-fraction * potential-adopters * adopters / total-population" "adoption-from-wom"
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 62 278 50 50
            org.nlogo.sdm.gui.WrappedConverter "0.011" "ad-effectiveness"
        org.nlogo.sdm.gui.BindingConnection 2 101 292 146 261 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 12
            org.jhotdraw.contrib.ChopDiamondConnector REF 8
        org.nlogo.sdm.gui.BindingConnection 2 456 206 416 239 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 4
            org.jhotdraw.contrib.ChopDiamondConnector REF 10
        org.nlogo.sdm.gui.BindingConnection 2 451 290 416 262 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 1
            org.jhotdraw.contrib.ChopDiamondConnector REF 10
        org.nlogo.sdm.gui.BindingConnection 2 343 293 388 261 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 6
            org.jhotdraw.contrib.ChopDiamondConnector REF 10
        org.nlogo.sdm.gui.StockFigure "attributes" "attributes" 1 "FillColor" "Color" 225 225 182 49 155 60 40
            org.nlogo.sdm.gui.WrappedStock "potential-adopters" "500" 0
        org.nlogo.sdm.gui.RateConnection 3 121 174 286 174 452 174 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 26
            org.jhotdraw.standard.ChopBoxConnector REF 4
            org.nlogo.sdm.gui.WrappedRate "adoption-from-ad + adoption-from-wom" "adoption-rate" REF 27 REF 5 0
        org.nlogo.sdm.gui.BindingConnection 2 113 207 148 238 NULL NULL 0 0 0
            org.jhotdraw.standard.ChopBoxConnector REF 26
            org.jhotdraw.contrib.ChopDiamondConnector REF 8
        org.nlogo.sdm.gui.BindingConnection 2 387 241 286 174 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 10
            org.nlogo.sdm.gui.ChopRateConnector REF 28
        org.nlogo.sdm.gui.BindingConnection 2 176 241 286 174 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 8
            org.nlogo.sdm.gui.ChopRateConnector REF 28
        org.nlogo.sdm.gui.ConverterFigure "attributes" "attributes" 1 "FillColor" "Color" 130 188 183 298 58 50 50
            org.nlogo.sdm.gui.WrappedConverter "50000" "total-population"
        org.nlogo.sdm.gui.BindingConnection 2 331 99 394 234 NULL NULL 0 0 0
            org.jhotdraw.contrib.ChopDiamondConnector REF 41
            org.jhotdraw.contrib.ChopDiamondConnector REF 10
@#$#@#$#@
<experiments>
  <experiment name="experimentSept23" repetitions="1" runMetricsEveryStep="true">
    <setup>set-up</setup>
    <go>go</go>
    <metric>count turtles</metric>
    <enumeratedValueSet variable="number-hemp-farmers">
      <value value="13"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="policy-change">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="processing-facilities">
      <value value="0"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
1
@#$#@#$#@
