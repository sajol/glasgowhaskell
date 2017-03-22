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