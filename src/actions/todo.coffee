
Quamolit = require 'quamolit'

exports.create = (text) ->
  payload = text: text
  Quamolit.dispatch 'todo/create', payload

exports.delete = (payload) ->
  Quamolit.dispatch 'todo/delete', payload

exports.update = (payload) ->
  Quamolit.dispatch 'todo/update', payload

window.e = (a, b) ->
  Quamolit.dispatch a, b
