## Christmas Tree

At this festive time of year, we like to sit by the fire and eat mince pies.

Here's a problem to keep you busy once you realise you can no longer get out of
your chair.

Write a program that builds a festive-themed tree.

Here's an example usage:

```ruby
tree = Tree.parse("

              chestnuts
               /     \
          roasting    on
           /    \       \
         an     open     fire
        /  \       \        \
      jack frost   nipping  on
                            / \
                          your nose

")

root = tree.root
root.value
#=> "chestnuts"

root.children.map do |child|
  child.value
end
#=> ["roasting", "on"]
```

## Extensions

a) Implement a breadth-first traversal of the tree:

```ruby
tree.breadth_first.map do |node|
  node.value
end
#=> ["chestnuts", "roasting", "on", "an", "open", "fire", etc]
```

---

b) Add in support for comments when describing trees:

```ruby
tree = Tree.parse("

          on
         /  \
       your  nose  # Ouch!

")
```

---

c) Implement an #ancestors method:

```ruby
nipping_node.ancestors.map do |node|
  node.value
end
#=> ["on", "roasting", "chestnuts"]
```

---

d) Come up with some Christmas-themed requirements of your own.

These should be as festive as possible.
