
data Queue a = Queue [a] deriving (Show)

push :: a -> Queue a -> Queue a
push e (Queue es) = Queue (es ++ [e])


pop :: Queue a -> (a, Queue a)
pop (Queue es) = (head es, Queue (tail es))


peek :: Queue a -> a
peek (Queue (e:es)) = e


dummyQueue = populateQueue (Queue []) [1..10]
             where
                populateQueue queue [] = queue
                populateQueue queue (x : xs) = populateQueue (push x queue) xs


