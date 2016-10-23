
-- Data types

data Bright = Blue | Red deriving (Read, Show)

darkBright :: Bright -> Bool
darkBright Blue = True
darkBright Red = False

lightenBright :: Bright -> Bright
lightenBright Blue = Red
lightenBright Red = Red

data Pastel = Turquiose | Tan deriving (Read, Show)

darkPastel :: Pastel -> Bool
darkPastel Turquiose = True
darkPastel Tan = False

lightenPastel :: Pastel -> Pastel
lightenPastel Turquiose = Tan
lightenPastel Tan = Tan


class Color a where
    dark :: a -> Bool
    lighten :: a -> a

instance Color Bright where
    dark = darkBright
    lighten = lightenBright

instance Color Pastel where
    dark = darkPastel
    lighten = lightenPastel








