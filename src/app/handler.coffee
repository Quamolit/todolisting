
Quamolit = require 'quamolit'

{input} = Quamolit.elements
{button} = Quamolit.elements

module.exports = Quamolit.createComponent
  name: 'handler'

  getKeyframe: ->
    x: 0
    y: 0

  getEnteringKeyframe: ->
    x: -40
    y: 0

  getLeavingKeyframe: ->
    x: -40
    y: 0

  onButtonClick: (event) ->
    console.log 'button click:', event

  onInputClick: (event) ->
    console.log 'input click:', event

  render: -> [
    input x: -50, y: 0,
      text: '', onClick: @onInputClick
    button x: 60, y: 0,
      text: 'x'
      onClick: @onButtonClick
  ]
