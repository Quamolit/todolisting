
Quamolit = require 'quamolit'

todoActions = require '../actions/todo'

{input} = Quamolit.elements
{button} = Quamolit.elements

module.exports = Quamolit.createComponent
  name: 'handler'

  getInitialState: ->
    text: ''

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
    if @state.text.length > 0
      todoActions.create @state.text
    @setState text: ''

  onTextChange: (event) ->
    @setState text: event.text

  render: -> [
    input x: -50, y: 0,
      vx: 100, xy: 20
      text: @state.text
      onChange: @onTextChange
    button x: 100, y: 0,
      vx: 40, xy: 20
      text: 'create'
      onClick: @onButtonClick
  ]
