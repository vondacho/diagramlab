-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphql.Object.Color exposing (..)

import Graphql.Internal.Builder.Object as Object
import Graphql.Object
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| -}
foregroundColor : SelectionSet String Graphql.Object.Color
foregroundColor =
    Object.selectionForField "String" "foregroundColor" [] Decode.string


{-| -}
backgroundColor : SelectionSet String Graphql.Object.Color
backgroundColor =
    Object.selectionForField "String" "backgroundColor" [] Decode.string
