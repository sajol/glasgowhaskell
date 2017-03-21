module ConsDeconsValues where


data GuessWhat =
    Chickenbutt deriving (Eq, Show)


data Id a =
    MkId a deriving (Eq, Show)


data Product a b =
    Product a b deriving (Eq, Show)


data Sum a b =
    First a | Second b deriving (Eq, Show)


data RecordProduct a b =
    RecordProduct {
        pfirst :: a,
        psecond :: b
    } deriving (Eq, Show)


newtype NumCow = NumCow Int deriving (Eq, Show)

newtype NumPig = NumPig Int deriving (Eq, Show)

data FarmHouse = FarmHouse NumCow NumPig deriving (Eq, Show)

type FarmHouse' = Product NumCow NumPig

newtype NumSheep = NumSheep Int deriving (Eq, Show)

data BigFarmHouse =
    BigFarmHouse NumCow NumPig NumSheep
    deriving (Eq, Show)

type BigFarmHouse' =
    Product NumCow (Product NumPig NumSheep)


type Name = String
type Age = Int
type LovesMud = Bool

type PoundsOfWool = Int

data CowInfo =
    CowInfo Name Age deriving (Eq, Show)

data PigInfo =
    PigInfo Name Age LovesMud deriving (Eq, Show)

data SheepInfo =
    SheepInfo Name Age PoundsOfWool deriving (Eq, Show)


data Animal = Cow CowInfo
            | Pig PigInfo
            | Sheep SheepInfo
            deriving (Eq, Show)

type Animal' =
    Sum CowInfo (Sum PigInfo SheepInfo)


--constructing values

trivialValue :: GuessWhat
trivialValue = Chickenbutt


idInt :: Id Integer
idInt = MkId 10


identity :: Id (a -> a)
identity = MkId (\x -> x)


type Awesome = Bool
type Name' = String

person :: Product Name' Awesome
person = Product "Simon" True


--data Twitter = Twitter deriving (Eq, Show)

--data AskFm = AskFm deriving (Eq, Show)

--socialNetwork :: Sum Twitter AskFm
--socialNetwork = First Twitter

data SocialNetwork = Twitter
                   | AskFm
                   deriving (Eq, Show)


--how this will look with type synonyms

type Twitter = String
type AskFm = String

twitter :: Sum Twitter AskFm
twitter = First "Twitter"



myRecord :: RecordProduct Integer Float
myRecord = RecordProduct 42 0.0001

myRecord' :: RecordProduct Integer Float
myRecord' =
    RecordProduct{
        pfirst = 42,
        psecond = 0.0001
    }


data OperatingSystem = GnuPlusLinux
                     | OpenBSDPlusNeverMindJustBSDStill
                     | Mac
                     | Windows
                     deriving (Eq, Show)


data ProgrammingLanguage = Haskell
                         | Agda
                         | Idris
                         | PureScript
                         deriving (Eq, Show)

data Programmer =
    Programmer {
        os :: OperatingSystem,
        language :: ProgrammingLanguage
    }
    deriving (Eq, Show)


nineToFive :: Programmer
nineToFive =
    Programmer{
        os = Mac,
        language = Haskell
    }


feelingWizardly :: Programmer
feelingWizardly =
    Programmer{
        os = GnuPlusLinux,
        language = Agda
    }


--exercise

--Write a function that generates all possible values of Programmer . Use
--the provided lists of inhabitants of OperatingSystem and Program-
--mingLanguage.


allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
    [
        GnuPlusLinux,
        OpenBSDPlusNeverMindJustBSDStill,
        Mac,
        Windows
    ]


allLanguages :: [ProgrammingLanguage]
allLanguages = [Haskell, Agda, Idris, PureScript]


allProgrammers :: [Programmer]
allProgrammers = [Programmer os lang | os <- allOperatingSystems, lang <- allLanguages]


--partial application of data constructor
data ThereYet =
    There Integer Float String Bool
    deriving (Eq, Show)


--who need a "builder pattern"?

nope :: Float -> String -> Bool -> ThereYet
nope = There 10

notYet :: String -> Bool -> ThereYet
notYet = nope 25.5

notQuite :: Bool -> ThereYet
notQuite = notYet "woohoo"

yussss :: ThereYet
yussss = notQuite False

--type progession
--There    :: Integer -> Float -> String -> Bool -> ThereYet
--nope     ::            Float -> String -> Bool -> ThereYet
--notYet   ::                     String -> Bool -> ThereYet
--notQuite ::                               Bool -> ThereYet
--yussss   ::                                       ThereYet


