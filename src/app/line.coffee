
Quamolit = require 'quamolit'

todoActions = require '../actions/todo'

{check} = Quamolit.elements
{input} = Quamolit.elements

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

  render: -> [
    check x: -40, y: 0,
      checked: @props.data.done
      onClick: @onCheckClick
    input x: 40, y: 0,
      text: @props.data.text
      onChange: @onTextChange
  ]
