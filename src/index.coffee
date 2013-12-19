fs = require 'fs'
path = require 'path'
hogan = require 'hogan-updated'

module.exports = (env, callback) ->

  partials = {}

  class HoganTemplate extends env.TemplatePlugin

    constructor: (@tpl) ->

    render: (locals, callback) ->
      try
        callback null, new Buffer @tpl.render(locals, partials)
      catch error
        callback(error)

  HoganTemplate.fromFile = (filepath, callback) ->
    fs.readFile filepath.full, (error, result) ->
      if error then callback error
      else
        try
          filename = path.basename filepath.relative, '.mustache'
          compiled = hogan.compile result.toString()
          partials[filename] = compiled
          tpl = compiled
          callback error, new HoganTemplate tpl
        catch error
          callback error

  env.registerTemplatePlugin '**/*.mustache', HoganTemplate
  callback()
