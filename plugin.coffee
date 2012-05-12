
hogan = require 'hogan.js'
path = require 'path'
fs = require 'fs'

module.exports = (wintersmith, callback) ->

  # compiled partial templates
  partials = {}
  partialDir = 'partials'

  class HoganTemplate extends wintersmith.TemplatePlugin

    constructor: (@tpl) ->

    render: (locals, callback) ->
      try
        callback null, new Buffer @tpl.render(locals, partials)
      catch error
        callback error
  
  HoganTemplate.fromFile = (filename, base, callback) ->
    fs.readFile path.join(base, filename), (error, contents) ->
      if error then callback error
      else
        try
          tpl = hogan.compile contents.toString()
          callback null, new HoganTemplate tpl
        catch error
          callback error

  class HoganPartial extends HoganTemplate

  HoganPartial.fromFile = (filename, base, callback) ->
    fs.readFile path.join(base, filename), (error, contents) ->
      if error then callback error
      else
        try
          ext = path.extname(filename)
          basename = path.basename(filename, ext)
          tpl = hogan.compile contents.toString()
          partials[basename] = tpl
          callback null, new HoganPartial tpl
        catch error
          callback error
      
  wintersmith.registerTemplatePlugin '**/*.*(mustache|hogan)', HoganTemplate
  wintersmith.registerTemplatePlugin "**/#{partialDir}/*.*(mustache|hogan)", HoganPartial
  callback()
