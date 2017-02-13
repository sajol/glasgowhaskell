module Penguin where

data WherePenguinsLive =   Galapagos
                         | Antarctica
                         | Australia
                         | SouthAfrica
                         | SouthAmerica
                         deriving (Eq, Show)


data Penguin = Peng WherePenguinsLive
               deriving (Eq, Show)


isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica = True
isSouthAfrica _ = False


gimmeWhereTheyLive :: Penguin -> WherePenguinsLive
gimmeWhereTheyLive (Peng whereItLives) = whereItLives


galapagosPenguin :: Penguin -> Bool
galapagosPenguin (Peng Galapagos) = True
galapagosPenguin _ = False


antarcticPenguin :: Penguin -> Bool
antarcticPenguin (Peng Antarctica) = True
antarcticPenguin _ = False


australianPenguin :: Penguin -> Bool
australianPenguin (Peng Australia) = True
australianPenguin _ = False


antarticOrGalapagosPenguin :: Penguin -> Bool
antarticOrGalapagosPenguin penguin =
    galapagosPenguin penguin || antarcticPenguin penguin