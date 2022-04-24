-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphql.Query exposing (..)

import Graphql.Enum.Diagram
import Graphql.Internal.Builder.Argument as Argument
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode
import Graphql.Object
import Graphql.Operation exposing (RootQuery)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.Scalar
import Graphql.ScalarCodecs
import Graphql.SelectionSet exposing (SelectionSet)
import Graphql.Union
import Json.Decode as Decode


type alias AllItemsOptionalArguments =
    { offset : OptionalArgument Int
    , limit : OptionalArgument Int
    }


{-|

  - offset -
  - limit -

-}
allItems :
    (AllItemsOptionalArguments -> AllItemsOptionalArguments)
    -> SelectionSet decodesTo Graphql.Union.DiagramItem
    -> SelectionSet (Maybe (List decodesTo)) RootQuery
allItems fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { offset = Absent, limit = Absent }

        optionalArgs____ =
            [ Argument.optional "offset" filledInOptionals____.offset Encode.int, Argument.optional "limit" filledInOptionals____.limit Encode.int ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "allItems" optionalArgs____ object____ (Decode.list >> Decode.nullable)


type alias ItemOptionalArguments =
    { isPublic : OptionalArgument Bool }


type alias ItemRequiredArguments =
    { id : Graphql.ScalarCodecs.Id }


{-|

  - id -
  - isPublic -

-}
item :
    (ItemOptionalArguments -> ItemOptionalArguments)
    -> ItemRequiredArguments
    -> SelectionSet decodesTo Graphql.Object.Item
    -> SelectionSet decodesTo RootQuery
item fillInOptionals____ requiredArgs____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { isPublic = Absent }

        optionalArgs____ =
            [ Argument.optional "isPublic" filledInOptionals____.isPublic Encode.bool ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "item" (optionalArgs____ ++ [ Argument.required "id" requiredArgs____.id (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapEncoder .codecId) ]) object____ Basics.identity


type alias ItemsOptionalArguments =
    { offset : OptionalArgument Int
    , limit : OptionalArgument Int
    , isBookmark : OptionalArgument Bool
    , isPublic : OptionalArgument Bool
    }


{-|

  - offset -
  - limit -
  - isBookmark -
  - isPublic -

-}
items :
    (ItemsOptionalArguments -> ItemsOptionalArguments)
    -> SelectionSet decodesTo Graphql.Object.Item
    -> SelectionSet (List (Maybe decodesTo)) RootQuery
items fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { offset = Absent, limit = Absent, isBookmark = Absent, isPublic = Absent }

        optionalArgs____ =
            [ Argument.optional "offset" filledInOptionals____.offset Encode.int, Argument.optional "limit" filledInOptionals____.limit Encode.int, Argument.optional "isBookmark" filledInOptionals____.isBookmark Encode.bool, Argument.optional "isPublic" filledInOptionals____.isPublic Encode.bool ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "items" optionalArgs____ object____ (Decode.nullable >> Decode.list)


type alias ShareItemOptionalArguments =
    { password : OptionalArgument String }


type alias ShareItemRequiredArguments =
    { token : String }


{-|

  - token -
  - password -

-}
shareItem :
    (ShareItemOptionalArguments -> ShareItemOptionalArguments)
    -> ShareItemRequiredArguments
    -> SelectionSet decodesTo Graphql.Object.Item
    -> SelectionSet decodesTo RootQuery
shareItem fillInOptionals____ requiredArgs____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { password = Absent }

        optionalArgs____ =
            [ Argument.optional "password" filledInOptionals____.password Encode.string ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "shareItem" (optionalArgs____ ++ [ Argument.required "token" requiredArgs____.token Encode.string ]) object____ Basics.identity


type alias ShareConditionRequiredArguments =
    { id : Graphql.ScalarCodecs.Id }


{-|

  - id -

-}
shareCondition :
    ShareConditionRequiredArguments
    -> SelectionSet decodesTo Graphql.Object.ShareCondition
    -> SelectionSet (Maybe decodesTo) RootQuery
shareCondition requiredArgs____ object____ =
    Object.selectionForCompositeField "ShareCondition" [ Argument.required "id" requiredArgs____.id (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapEncoder .codecId) ] object____ Decode.nullable


type alias GistItemRequiredArguments =
    { id : Graphql.ScalarCodecs.Id }


{-|

  - id -

-}
gistItem :
    GistItemRequiredArguments
    -> SelectionSet decodesTo Graphql.Object.GistItem
    -> SelectionSet decodesTo RootQuery
gistItem requiredArgs____ object____ =
    Object.selectionForCompositeField "gistItem" [ Argument.required "id" requiredArgs____.id (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapEncoder .codecId) ] object____ Basics.identity


type alias GistItemsOptionalArguments =
    { offset : OptionalArgument Int
    , limit : OptionalArgument Int
    }


{-|

  - offset -
  - limit -

-}
gistItems :
    (GistItemsOptionalArguments -> GistItemsOptionalArguments)
    -> SelectionSet decodesTo Graphql.Object.GistItem
    -> SelectionSet (List (Maybe decodesTo)) RootQuery
gistItems fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { offset = Absent, limit = Absent }

        optionalArgs____ =
            [ Argument.optional "offset" filledInOptionals____.offset Encode.int, Argument.optional "limit" filledInOptionals____.limit Encode.int ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "gistItems" optionalArgs____ object____ (Decode.nullable >> Decode.list)


type alias SettingsRequiredArguments =
    { diagram : Graphql.Enum.Diagram.Diagram }


{-|

  - diagram -

-}
settings :
    SettingsRequiredArguments
    -> SelectionSet decodesTo Graphql.Object.Settings
    -> SelectionSet decodesTo RootQuery
settings requiredArgs____ object____ =
    Object.selectionForCompositeField "settings" [ Argument.required "diagram" requiredArgs____.diagram (Encode.enum Graphql.Enum.Diagram.toString) ] object____ Basics.identity
