module BinaryTree where

data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)


insert :: Ord a => a -> BinaryTree a -> BinaryTree a
insert b Leaf = Node Leaf b Leaf
insert b (Node left a right)
    | b == a = Node left a right
    | b < a = Node (insert b left) a right
    | b > a = Node left a (insert b right)


n1 = insert 0 Leaf
n2 = insert 3 n1
n3 = insert 5 n2
n4 = insert 2 n3


mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree f Leaf = Leaf
mapTree f (Node left a right) =
    Node (mapTree f left) (f a) (mapTree f right)


testTree :: BinaryTree Integer
testTree = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)


mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)


--acceptance test for mapTree
mapOkay =
    if mapTree (+1) testTree == mapExpected
    then print "yup okay!"
    else error "test failed"