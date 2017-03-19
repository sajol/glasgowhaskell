module ProductType where

data QuantumBool = QuantumTrue
                 | QuantumFalse
                 | QuantumBoth
                 deriving (Eq, Show)
--cardinality = 3

data TwoQs = MkTwoQs QuantumBool QuantumBool deriving (Eq, Show)

--cardinality = 3 * 3 = 9



--TwoQs can be represented using  type aliases and tuple
--data constructor. type aliases create type constructor
--not data cosntructor

type TwoQs' = (QuantumBool, QuantumBool)


--cardinality of a data type roughly equated to how difficult
--it is to reason about.


--record syntax
--records in haskell are product types with additional syntax
--to provide convenient accessors to the fields within then
--record

data Person = MkPerson String Int deriving (Eq, Show)

jm = MkPerson "julie" 108
ca = MkPerson "chris" 16


namae :: Person -> String
namae (MkPerson s _) = s


--person with record syntax
data Person' =
    Person' {
        name :: String,
        age :: Int
    }
    deriving (Show, Eq)




















