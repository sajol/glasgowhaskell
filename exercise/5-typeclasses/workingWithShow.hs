module WorkingWithShow where

data Mood = Blah | Woot


--minimal implementation of an instance of Show only requires
--that show or shorsPrec be implemented

instance Show Mood where
    show Woot = "Woot"
    show _ = "Blah"

--using deriving
data MoodDeriving = BlahD | WootD deriving Show