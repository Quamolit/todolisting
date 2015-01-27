
Quamolit = require 'quamolit'

todoActions = require '../actions/todo'

{check} = Quamolit.elements
{input} = Quamolit.elements
{rect} = Quamolit.elements

module.exports = Quamolit.createComponent
  name: "line"

  getKeyframe: ->
    x: 0
    y: 0

  getEnteringKeyframe: ->
    x: -40
    y: 0

  getLeavingKeyframe: ->
    x: -40
    y: 0

  onCheckClick: ->
    newState = not @props.data.done
    todoActions.update id: @props.data.id, done: newState

  onTextChange: (event) ->
    todoActions.update id: @props.data.id, text: event.text

  onDelete: (event) ->
    console.log 'delete'
    event.bubble = false
    todoActions.delete @props.data.id

  render: -> [
    check x: -80, y: 0,
      checked: @props.data.done
      onClick: @onCheckClick
    input x: 60, y: 0,
      vx: 100, vy: 20
      text: @props.data.text
      onChange: @onTextChange
    rect x: 180, y: 0,
      vx: 10, vy: 10
      color: 'red'
      onClick: @onDelete
  ]
