# LRU-cache
## LRU cache - As cache can only hold a fixed number of things so in LRU we remove the least recently used item in the cache to make room for the new item.

###### Data structure of LRU will consist of Hash for fast lookup and Doubly Linked List(DLL) for fast removal of least recently used item.
Hash key's values will be nodes within the doubly linked list.
In DLL the least recently used items will be head and most recently used will be tail.

###### LRU class have two methods get() and set() which are defined as follows.
**get(x)** : Gets the value of the key x if the key exists in the cache
otherwise returns -1.\
**set(x,y)** : Inserts the value if the key x is not already present. If the
cache reaches its capacity it invalidate the least recently used
item before inserting the new item.\
In the constructor of the class the size of the cache is initialized.\

Have attached the sample bit of code in solution.rb file; output of which will be:

```
"head val: one"
"tail val: three"
"two"
"one"
"head val: three"
"tail val: one"
-1
"four"
"head val: one"
"tail val: four"
```

You can change it and play around.
