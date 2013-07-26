{Set, SortedSet} = require '../src/set'

describe 'Set', ->
  beforeEach ->
    @set = new Set
    @set.push 1
    @set.push 2
    @set.push 4
    
  describe '#constructor', ->
    it 'creates a set with arguments as elements, or with elements of array as elements', ->
      set = new Set 2, 3, 4
      set.size().should.equal 3
      set = new Set [1, 2, 3]
      set.size().should.equal 3
    
  describe '#size', ->
    it 'returns how many elements are there in the set', ->
      @set.size().should.equal 3
      @set.push 'a'
      @set.size().should.equal 4
      @set.push 'a'
      @set.size().should.equal 4
      
  describe '#member', ->
    it 'returns whether an element is a member of a set or not', ->
      console.log 'membership', @set.member(1), @set.member(3)
      @set.member(1).should.be.true
      @set.member(3).should.be.false
    
  describe '#push', ->
    it 'should add an extra element only if not in set already', ->
      @set.push 1
      @set.size().should.equal 3
      @set.push 3
      @set.size().should.equal 4
      
  describe '#pop()', ->
    it 'should remove one element in array', ->
      @set.pop(2)
      @set.size().should.equal 2
      
describe 'SortedSet', ->
  beforeEach ->
    @set = new SortedSet
    @set.push 1
    @set.push 2
    @set.push 4
    
  describe '#constructor', ->
    it 'creates a set with arguments as elements, or with elements of array as elements', ->
      set = new SortedSet 2, 3, 4
      set.size().should.equal 3
      set = new SortedSet [1, 2, 3]
      set.size().should.equal 3
    
  describe '#size', ->
    it 'returns how many elements are there in the set', ->
      @set.size().should.equal 3
      @set.push 3
      @set.size().should.equal 4
      @set.push 3
      @set.size().should.equal 4
      
  describe '#member', ->
    it 'returns whether an element is a member of a set or not', ->
      console.log "le set", @set, @set.find(1), @set.member(1), @set.find(3), @set.member(3)
      @set.member(1).should.be.true
      @set.member(3).should.be.false
    
  describe '#push', ->
    it 'should add an extra element only if not in set already', ->
      @set.push 1
      @set.size().should.equal 3
      @set.push 3
      @set.size().should.equal 4
      
  describe '#pop()', ->
    it 'should remove one element in array', ->
      @set.pop(2)
      @set.size().should.equal 2