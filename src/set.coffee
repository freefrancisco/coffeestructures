class Set
  constructor: (vals...)->
    @_vals = {}
    @pushAll(vals...)
  
  push: (val) ->
    @_vals[val] = true
    val
    
  pushAll: (list...) ->
    @push item for item in @_listOrArgs list
      
  
  pop: (val = null) ->
    console.log "calling pop with val #{val}"
    val ?= @toArray().pop()
    delete @_vals[val]
    val
    
  popAll: (list...) ->
    @pop item for item in @_listOrArgs list
  
  member: (val) ->
    console.log @_vals, val, @_vals[val], @_vals[val]?
    @_vals[val]?

  size: ->
    @toArray().length

  toArray: ->
    (keys for keys of @_vals)
    
  toString: ->
    @toArray()
    
  _listOrArgs: (list) ->
    if list.length is 1 and list[0] instanceof Array
      list[0]
    else
      list
    
  
@Set = Set