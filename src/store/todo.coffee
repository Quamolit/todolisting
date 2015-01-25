
Quamolit  = require 'quamolit'
shortid   = require 'shortid'
_         = require 'lodash'

todoStore = Quamolit.createStore

  actions:
    'todo/create': 'create'
    'todo/delete': 'delete'
    'todo/update': 'update'

  getters:
    'all': 'getAll'

  initialize: ->
    @data = [
      id: 'eee1'
      text: 'a'
      done: yes
    ,
      id: 'eee2'
      text: 'b'
      done: no
    ]

  getAll: ->
    @data

  create: (data) ->
    data.id = shortid.generate()
    @data.unshift data
    @change()

  delete: (id) ->
    @data = @data.filter (x) -> x.id isnt id
    @change()

  update: (data) ->
    item = _.find @data, id: data.id
    _.assign item, data
    @change()

exports.get = (getter, query) -> todoStore.get getter, query
exports.register = (cb) -> todoStore.register cb
exports.unregister = (cb) -> todoStore.unregister cb
