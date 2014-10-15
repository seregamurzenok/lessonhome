
coffee = require 'coffee-script'

class module.exports
  constructor : (@site,@name)->
    @path   = "#{process.cwd()}/#{@site.path.states}/#{@name}.coffee"
    @inited = false
  init : =>
    _module = @function_module
    _state  = @function_state
    try
      state = coffee._compileFile @path
    catch e
      throw new Error "Failed compile state #{@name}:\n"+e 
    state = "
      var state = {};
      (function(){
        var module  = _module;
        var state   = _state;
        var F       = (function (str){
          return \"/file/666/\"+str;
        });
        #{state}
      }).call(state);
      state
    "
    @state         = eval state
    @state.struct ?= {}
    @title = @name
    if @state.title?
      @title = @state.title
      
    @inited = true
  function_state  : (o)=>
    try
      @site.createState o
    catch e
      throw new Error "Failed compile state '#{o}' from state '#{@name}':\n"+e
    state = CLONE @site.state[o].state.struct
    return state
  function_module : (o)=>
    mod = {}
    mod._isModule   = true
    name = 'unknown'
    m    = {}
    switch typeof o
      when 'string'
        name = o
      when 'object'
        for key,val of o
          name  = key
          m     = val
      else
        throw new Error 'wrong module name', o
    mod._name  = name
    for key,val of m
      mod[key] = val
    if !@site.modules[name]?
      throw new Error "Can't find module '#{name}' in state '#{@name}'"
    return mod



