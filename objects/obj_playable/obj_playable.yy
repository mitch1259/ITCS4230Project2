{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_playable",
  "spriteId": null,
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "obj_character",
    "path": "objects/obj_character/obj_character.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":1,"eventType":9,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":1,"eventType":2,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"jump_key","varType":6,"value":"ord(\"W\")","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "ord(\"W\")",
        "vk_up",
      ],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"move_left_key","varType":6,"value":"ord(\"A\")","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "ord(\"A\")",
        "vk_left",
      ],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"crouch_key","varType":6,"value":"ord(\"S\")","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "ord(\"S\")",
        "vk_down",
      ],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"move_right_key","varType":6,"value":"ord(\"D\")","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "ord(\"D\")",
        "vk_right",
      ],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"action1_key","varType":6,"value":"ord(\"G\")","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "ord(\"G\")",
        "188",
      ],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"action2_key","varType":6,"value":"ord(\"H\")","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "ord(\"H\")",
        "190",
      ],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"action3_key","varType":6,"value":"ord(\"J\")","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "ord(\"J\")",
        "191",
      ],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"combo_timeout","varType":0,"value":"0.25","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [],
  "parent": {
    "name": "Characters",
    "path": "folders/Objects/Characters.yy",
  },
}