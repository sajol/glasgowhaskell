
data Tree = Leaf | Node Int  Tree Tree deriving Show

treeDepth :: Tree -> Int
treeDepth Leaf = 0
treeDepth (Node _ left right) = 1 + max (treeDepth left) (treeDepth right)


treeSum :: Tree -> Int
treeSum Leaf = 0
treeSum (Node payload left right) = payload + treeSum left + treeSum right

{-isSorted (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) 0 1000-}
isSorted :: Tree -> Int -> Int -> Bool
isSorted Leaf _ _ = True
isSorted (Node value left right) min max =
    let
        isLeftSorted = isSorted left min value
        isRightSorted = isSorted right value max
    in
       value >= min && value <= max && isLeftSorted && isRightSorted



addNewMax :: Tree -> Tree
addNewMax Leaf = Node 0 Leaf Leaf
addNewMax (Node value left Leaf) = Node value left (Node (value +1) Leaf Leaf)
addNewMax (Node value left right) = Node value left (addNewMax right)


tree = (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf))

traversePreOrder :: Tree -> [Int]
traversePreOrder Leaf = []
traversePreOrder (Node value left right) = [value] ++ traversePreOrder left ++ traversePreOrder right

traverseInOrder :: Tree -> [Int]
traverseInOrder Leaf = []
traverseInOrder (Node value left right) = traverseInOrder left ++ [value] ++ traverseInOrder right

traversePostOrder :: Tree -> [Int]
traversePostOrder Leaf = []
traversePostOrder (Node value left right) = traversePostOrder left ++ traversePostOrder right ++ [value]


dfs :: Tree -> [Int]
dfs Leaf = []
dfs (Node value left right) = [value] ++ dfs left ++ dfs right

