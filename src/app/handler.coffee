
Quamolit = require 'quamolit'
shortid = require 'shortid'

todoActions = require '../actions/todo'

line = require './line'

{button} = Quamolit.elements

module.exports = Quamolit.createComponent
  name: 'handler'

  getInitialState: ->
    text: ''
    id: shortid.generate()

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
      todoActions.create
        id: @state.id
        text: @state.text
        checked: false
    @setState text: '', id: shortid.generate()

  onTextChange: (text) ->
    @setState {text}

  render: -> [
    line {x: -50, y: 0},
      id: "line.#{@state.id}"
      data:
        text: @state.text
        id: @state.id
        checked: false
      isComposing: true
      onTextChange: @onTextChange
    button {x: 160, y: 0},
      vx: 40, xy: 20
      text: 'create'
      onClick: @onButtonClick
  ]
