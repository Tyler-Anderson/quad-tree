class Node
  constructor:(x, y, w, h,depth, maxChildren, maxDepth)->
    @children = []
    @nodes = []
    @x = x
    @y = y
    w:w
    h:h
    depth:depth
    TOP_LEFT = 0
    TOP_RIGHT = 1
    BOTTOM_LEFT = 2
    BOTTOM_RIGHT = 3
    PARENT = 4
    @maxDepth ?= 7
    @maxChildren ?= 4

  retrieve: (item) ->
    for i in [0...children.length]
      if @nodes.length
        @findOverlappingNodes( item, (dir)->
        @nodes[dir].retrieve(item))
    
  insert: (item) ->
    if @nodes.length
      i = @findInsertNode(item)
      if (i ==  PARENT)
        #console.log 'check 1'
        @children.push(item)
      else
        #console.log 'check 2'
        @nodes[i].insert(item)
    else
      #console.log 'check 3'
      @children.push(item)
      if @children.length > @maxChildren && @depth > @maxDepth
        console.log 'divide, check'
        @divide()
    
  findInsertNode: (item) ->
    #console.log 'findernoder'
    if (item.x + item.w < @x + (w / 2))
      if (item.y + item.h < @y + (h /2)) then TOP_LEFT
      if (item.y >= @y + (h / 2)) then BOTTOM_LEFT
      PARENT

    if (item.x >= @x + (w/2))
      if (item.y + item.h < @y + (h / 2)) then TOP_RIGHT
      if (item.y >= @y + (h / 2)) then BOTTOM_RIGHT
      PARENT

    PARENT

  findOverlappingNodes: (item)->
    if (item.x < @x + (w / 2))
      if (item.y < @y + (h/2)) then TOP_LEFT
      if (item.y + item.h >= y + (h / 2)) then BOTTOM_LEFT
      
    if (item.x + item.w >= @x + (w / 2))
      if (item.y < @y + (h/2)) then TOP_RIGHT
      if (item.y + item.h >= @y + (h / 2)) then BOTTOM_RIGHT
        

  divide: ->
    width = (w / 2)
    height = (h / 2)
    childDepth = @depth + 1
    @nodes.push node(@x, @y, width, height, childDepth, maxChildren, maxDepth)
    @nodes.push node(@x + width, @y, width, height, childDepth, maxChildren, maxDepth)
    @nodes.push node(@x, @y + height, width, height, childDepth, maxChildren, maxDepth)
    @nodes.push node(@x + width, @y + height, width, height, childDepth, maxChildren, maxDepth)
    
    oldChildren = children
    @children = []
    for i in [0...oldChildren.length]
      @insert oldChildren[i]

  clear: ->
    for i in [0...@nodes.length]
      @nodes[i].clear()
      @children.length = 0
      @nodes.length = 0

  getNodes: ->
      (if @nodes.length then @nodes else false)

module.exports = Node
