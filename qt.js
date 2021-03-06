// Generated by CoffeeScript 1.10.0
(function() {
  var Node, QuadTree;

  Node = require('./node.js');

  QuadTree = (function() {
    function QuadTree(x, y, w, h, depth, maxChildren, maxDepth) {
      this.root = new Node(x, y, w, h, depth, maxChildren, maxDepth);
    }

    QuadTree.prototype.insert = function(item) {
      var i, j, ref, results;
      if (item instanceof Array) {
        results = [];
        for (i = j = 0, ref = item.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
          results.push(this.root.insert(item[i]));
        }
        return results;
      } else {
        return this.root.insert(item);
      }
    };

    QuadTree.prototype.retrieve = function(item) {
      return this.root.retrieve(item);
    };

    QuadTree.prototype.clear = function() {
      return this.root.clear();
    };

    return QuadTree;

  })();

  module.exports = QuadTree;

}).call(this);
