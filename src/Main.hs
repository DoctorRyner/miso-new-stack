module Main where

import Miso
import Miso.String
import Language.Javascript.JSaddle.Warp as JSaddle

type Model = Int

defaultModel :: Model
defaultModel = 0

data Event
    = NoEvent
    | Inc
    | Dec
    deriving (Eq, Show)

update' :: Event -> Model -> Effect Event Model
update' event model = case event of
    NoEvent -> noEff model
    Inc     -> noEff $ succ model
    Dec     -> noEff $ pred model

view' :: Model -> View Event
view' model = div_ []
    [ text "Hello ~ Haskell GUI"
    , br_ []
    , button_ [ onClick Inc ] [ text "+" ]
    , text $ ms model
    , button_ [ onClick Dec ] [ text "-" ]
    ]

main :: IO ()
main = putStrLn "Work on http://localhost:8000" >>= \_ -> JSaddle.run 8000 $ startApp App {..}
  where
    initialAction = NoEvent
    model  = defaultModel
    update = update'
    view   = view'
    events = defaultEvents
    subs   = []
    mountPoint = Nothing