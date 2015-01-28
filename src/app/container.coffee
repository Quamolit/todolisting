
Quamolit = require 'quamolit'

todoStore = require '../store/todo'

line = require './line'
handler = require './handler'

module.exports = Quamolit.createComponent
  name: 'container'

  stores:
    todos: [todoStore, 'all']

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

  render: ->
    header = [
      handler
        x: 0
        y: -140
      ,
        {}
    ]

    items = @state.todos.map (data, index) =>
      order = index
      line {delay: (400 * order), x: 0, y: (80 * order - 80)},
        data: data
        id: "line.#{data.id}"
        isComposing: false

    header.concat items
