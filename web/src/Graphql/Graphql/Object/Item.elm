-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphql.Object.Item exposing (..)

import Graphql.Enum.Diagram
import Graphql.Internal.Builder.Object as Object
import Graphql.Object
import Graphql.Scalar
import Graphql.ScalarCodecs
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| -}
id : SelectionSet Graphql.ScalarCodecs.ItemIdScalar Graphql.Object.Item
id =
    Object.selectionForField "ScalarCodecs.ItemIdScalar" "id" [] (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapCodecs |> .codecItemIdScalar |> .decoder)


{-| -}
title : SelectionSet String Graphql.Object.Item
title =
    Object.selectionForField "String" "title" [] Decode.string


{-| -}
text : SelectionSet String Graphql.Object.Item
text =
    Object.selectionForField "String" "text" [] Decode.string


{-| -}
thumbnail : SelectionSet (Maybe String) Graphql.Object.Item
thumbnail =
    Object.selectionForField "(Maybe String)" "thumbnail" [] (Decode.string |> Decode.nullable)


{-| -}
diagram : SelectionSet Graphql.Enum.Diagram.Diagram Graphql.Object.Item
diagram =
    Object.selectionForField "Enum.Diagram.Diagram" "diagram" [] Graphql.Enum.Diagram.decoder


{-| -}
isPublic : SelectionSet Bool Graphql.Object.Item
isPublic =
    Object.selectionForField "Bool" "isPublic" [] Decode.bool


{-| -}
isBookmark : SelectionSet Bool Graphql.Object.Item
isBookmark =
    Object.selectionForField "Bool" "isBookmark" [] Decode.bool


{-| -}
createdAt : SelectionSet Graphql.ScalarCodecs.Time Graphql.Object.Item
createdAt =
    Object.selectionForField "ScalarCodecs.Time" "createdAt" [] (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapCodecs |> .codecTime |> .decoder)


{-| -}
updatedAt : SelectionSet Graphql.ScalarCodecs.Time Graphql.Object.Item
updatedAt =
    Object.selectionForField "ScalarCodecs.Time" "updatedAt" [] (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapCodecs |> .codecTime |> .decoder)
