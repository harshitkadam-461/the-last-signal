extends Node


var characters = {
	"Ethan": true, "Ryan": true, "Alex": true,
	"Jake": true, "Emma": true, "Noah": true
}
var clues := 0
var choices:={}
var flashlight_given_to =""

func kill_character(name):
  characters[name] = false
