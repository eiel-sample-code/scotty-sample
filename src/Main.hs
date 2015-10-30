{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import System.Environment (getEnvironment)
import Data.List (lookup)
import Data.Monoid (mconcat)
import Data.Maybe

main = getPort >>= flip scotty route
  where
    route =  do
      get "/" $ do
        html $ "Hello, World!"
      get "/:word" $ do
        beam <- param "word"
        html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]

getPort = getEnvironment >>= return . port
  where
    port = fromMaybe defaultPort . fmap read . lookup "PORT"

defaultPort = 3000
