module TypeAndValue where

data Price = Price Integer deriving (Eq, Show)

data Size = Size Integer deriving (Eq, Show)

data Manufacturer = Mini
                  | Mazda
                  | Tata
                  deriving (Eq, Show)


data Airline = PapuAir
             | Catapultsr'US
             | TakeYourChancesUnited
             deriving (Eq, Show)



data Vehicle = Car Manufacturer  Price
             | Plane Airline Size
             deriving (Eq, Show)



myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir (Size 1000)



--1.type of myCar
-- myCar :: Vehicle

--2.define the isCar function
isCar :: Vehicle -> Bool
isCar v =
    case v of
        Car _ _ -> True
        _       -> False


isCar' :: Vehicle -> Bool
isCar' (Car _ _) = True
isCar' _       = False


isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _         = False


areAllCars :: [Vehicle] -> Bool
areAllCars [] = False
areAllCars cars = foldr (\ c a -> (isCar c) && a) True cars


areCars :: [Vehicle] -> [Bool]
areCars cars = map isCar cars


--3.write a function to tell us the manufacturer of a piece of data
getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m


--4.what will happen if we pass plane in getMenu
--It will give us Non-exhaustive patterns exception. In this case we have to handle all the cases.


--5.Let’s say you’ve decided to add the size of the plane as an
--argument to the Plane constructor. Add that to your datatypes
--in the appropriate places and change your data and functions appropriately.

