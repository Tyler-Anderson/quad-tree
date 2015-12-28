Node = require('./node.js');
class QuadTree
  constructor:(x, y, w, h, depth, maxChildren, maxDepth)->
    @root = new Node(x, y, w, h, depth, maxChildren, maxDepth)
    #console.log @root
  insert: (item) ->
    if item instanceof Array
      for i in [0...item.length] then @root.insert item[i]
    else @root.insert item
  retrieve  :(item) -> @root.retrieve(item)
  clear     :-> @root.clear()

module.exports = QuadTree
