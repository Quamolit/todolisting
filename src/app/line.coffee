
Quamolit = require 'quamolit'

todoActions = require '../actions/todo'

{check} = Quamolit.elements
{input} = Quamolit.elements
{rect} = Quamolit.elements

module.exports = Quamolit.createComponent
  name: "line"

  propTypes:
    data: 'Object'
    isComposing: 'Boolean'
    onTextChange: 'Function'

  getKeyframe: ->
    x: 0
    y: 0
    size: 10

  getEnteringKeyframe: ->
    x: -40
    y: 0
    size: 0

  getLeavingKeyframe: ->
    x: -40
    y: 0
    size: 0

  onCheckClick: ->
    newState = not @props.data.done
    todoActions.update id: @props.data.id, done: newState

  onTextChange: (event) ->
    if @props.isComposing
      @props.onTextChange event.text
    else
      todoActions.update id: @props.data.id, text: event.text

  onDelete: (event) ->
    console.log 'delete'
    event.bubble = false
    todoActions.delete @props.data.id

  render: -> [
    unless @props.isComposing
      check
        x: -80, y: 0
      ,
        checked: @props.data.done
        onClick: @onCheckClick
    input x: 60, y: 0,
      vx: 100, vy: 20
      text: @props.data.text
      onChange: @onTextChange
    unless @props.isComposing
      rect
        x: 180, y: 0,
        vector:
          x: @frame.size
          y: @frame.size
      ,
        color: 'red'
        onClick: @onDelete
  ]
