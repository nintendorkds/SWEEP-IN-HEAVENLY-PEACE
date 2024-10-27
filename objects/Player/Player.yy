{
  "$GMObject":"",
  "%Name":"Player",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":1,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":{"name":"Enemy","path":"objects/Enemy/Enemy.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"Player",
  "overriddenProperties":[],
  "parent":{
    "name":"Objects",
    "path":"folders/Objects.yy",
  },
  "parentObjectId":null,
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"fric","filters":[],"listItems":[],"multiselect":false,"name":"fric","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":".91","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"slidefric","filters":[],"listItems":[],"multiselect":false,"name":"slidefric","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":".985","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"normalfric","filters":[],"listItems":[],"multiselect":false,"name":"normalfric","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"fric","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"xvel","filters":[],"listItems":[],"multiselect":false,"name":"xvel","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"yvel","filters":[],"listItems":[],"multiselect":false,"name":"yvel","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"grav","filters":[],"listItems":[],"multiselect":false,"name":"grav","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":".2","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"coyote","filters":[],"listItems":[],"multiselect":false,"name":"coyote","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"controller","filters":[],"listItems":[],"multiselect":false,"name":"controller","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"deadzone","filters":[],"listItems":[],"multiselect":false,"name":"deadzone","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":".15","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"jumppressed","filters":[],"listItems":[],"multiselect":false,"name":"jumppressed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"jumpbuffer","filters":[],"listItems":[],"multiselect":false,"name":"jumpbuffer","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"jumpingrn","filters":[],"listItems":[],"multiselect":false,"name":"jumpingrn","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"walkspeed","filters":[],"listItems":[],"multiselect":false,"name":"walkspeed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":".25","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"animation","filters":[],"listItems":[],"multiselect":false,"name":"animation","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"animstep","filters":[],"listItems":[],"multiselect":false,"name":"animstep","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"grounded","filters":[],"listItems":[],"multiselect":false,"name":"grounded","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"crouchframes","filters":[],"listItems":[],"multiselect":false,"name":"crouchframes","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"canwalljumpframes","filters":[],"listItems":[],"multiselect":false,"name":"canwalljumpframes","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"timer","filters":[],"listItems":[],"multiselect":false,"name":"timer","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"primarypressed","filters":[],"listItems":[],"multiselect":false,"name":"primarypressed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"primarybuffer","filters":[],"listItems":[],"multiselect":false,"name":"primarybuffer","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"primary","filters":[],"listItems":[],"multiselect":false,"name":"primary","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"spinning","filters":[],"listItems":[],"multiselect":false,"name":"spinning","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"JanitorSpr",
    "path":"sprites/JanitorSpr/JanitorSpr.yy",
  },
  "spriteMaskId":{
    "name":"JanitorSpr",
    "path":"sprites/JanitorSpr/JanitorSpr.yy",
  },
  "visible":true,
}