class BaseSet
  pushAll: (list...) ->
    @push item for item in @_listOrArgs list
  
  popAll: (list...) ->
    @pop item for item in @_listOrArgs list
  
  toString: ->
    @toArray()
    
  _listOrArgs: (list) ->
    if list.length is 1 and list[0] instanceof Array
      list[0]
    else
      list
      
class Set extends BaseSet
  constructor: (vals...)->
    @_vals = {}
    @pushAll(vals...)
  
  push: (val) ->
    @_vals[val] = true
    val
    
  pop: (val = null) ->
    val ?= @toArray().pop()
    delete @_vals[val]
    val
    
  member: (val) ->
    @_vals[val]?

  size: ->
    @toArray().length

  toArray: ->
    (keys for keys of @_vals)
    
class SortedSet extends BaseSet
  constructor: (vals...) ->
    @_vals = []
    @pushAll(vals...)
    
  push: (val) ->
    i = @bisect val
    return null if @_vals[i] is val
    switch i
      when 0 then @_vals.unshift val
      when @_vals.length then @_vals.push val
      else @_vals[i-1...i] = [@_vals[i-1], val]
    val
    
  pop: (val) ->
    i = @find val
    switch i
      when null then return null
      when 0 then @_vals.shift()
      when @_vals.length-1 then @_vals.pop()
      else @_vals[i-1..i+1] = [@_vals[i-1], @_vals[i+1]]
    val
    
  member: (val) ->
    @find(val)?
    
  size: ->
    @_vals.length
    
  toArray: ->
    @_vals[..]
    
  find: (val) ->
    i = @bisect val
    if @_vals[i] is val then i else null
  
  bisect: (val) ->
    low = 0
    high = @_vals.length - 1
    while low <= high
      mid = Math.floor (low + high) / 2
      return mid if val is @_vals[mid]
      switch
        when val < @_vals[mid] then high = mid - 1
        when val > @_vals[mid] then low = mid + 1
        else throw new Error "#{val} is not comparable with #{@_vals[mid]} in position #{mid}"
    return low
    
@Set = Set
@SortedSet = SortedSet
