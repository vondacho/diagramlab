-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphql.Mutation exposing (..)

import Graphql.Enum.Diagram
import Graphql.InputObject
import Graphql.Internal.Builder.Argument as Argument
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode
import Graphql.Object
import Graphql.Operation exposing (RootMutation)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.Scalar
import Graphql.ScalarCodecs
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


type alias SaveOptionalArguments =
    { isPublic : OptionalArgument Bool }


type alias SaveRequiredArguments =
    { input : Graphql.InputObject.InputItem }


{-|

  - input -
  - isPublic -

-}
save :
    (SaveOptionalArguments -> SaveOptionalArguments)
    -> SaveRequiredArguments
    -> SelectionSet decodesTo Graphql.Object.Item
    -> SelectionSet decodesTo RootMutation
save fillInOptionals____ requiredArgs____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { isPublic = Absent }

        optionalArgs____ =
            [ Argument.optional "isPublic" filledInOptionals____.isPublic Encode.bool ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForCompositeField "save" (optionalArgs____ ++ [ Argument.required "input" requiredArgs____.input Graphql.InputObject.encodeInputItem ]) object____ Basics.identity


type alias DeleteOptionalArguments =
    { isPublic : OptionalArgument Bool }


type alias DeleteRequiredArguments =
    { itemID : Graphql.ScalarCodecs.ItemIdScalar }


{-|

  - itemID -
  - isPublic -

-}
delete :
    (DeleteOptionalArguments -> DeleteOptionalArguments)
    -> DeleteRequiredArguments
    -> SelectionSet Graphql.ScalarCodecs.ItemIdScalar RootMutation
delete fillInOptionals____ requiredArgs____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { isPublic = Absent }

        optionalArgs____ =
            [ Argument.optional "isPublic" filledInOptionals____.isPublic Encode.bool ]
                |> List.filterMap Basics.identity
    in
    Object.selectionForField "ScalarCodecs.ItemIdScalar" "delete" (optionalArgs____ ++ [ Argument.required "itemID" requiredArgs____.itemID (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapEncoder .codecItemIdScalar) ]) (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapCodecs |> .codecItemIdScalar |> .decoder)


type alias BookmarkRequiredArguments =
    { itemID : Graphql.ScalarCodecs.ItemIdScalar
    , isBookmark : Bool
    }


{-|

  - itemID -
  - isBookmark -

-}
bookmark :
    BookmarkRequiredArguments
    -> SelectionSet decodesTo Graphql.Object.Item
    -> SelectionSet (Maybe decodesTo) RootMutation
bookmark requiredArgs____ object____ =
    Object.selectionForCompositeField "bookmark" [ Argument.required "itemID" requiredArgs____.itemID (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapEncoder .codecItemIdScalar), Argument.required "isBookmark" requiredArgs____.isBookmark Encode.bool ] object____ (Basics.identity >> Decode.nullable)


type alias ShareRequiredArguments =
    { input : Graphql.InputObject.InputShareItem }


{-|

  - input -

-}
share :
    ShareRequiredArguments
    -> SelectionSet String RootMutation
share requiredArgs____ =
    Object.selectionForField "String" "share" [ Argument.required "input" requiredArgs____.input Graphql.InputObject.encodeInputShareItem ] Decode.string


type alias SaveGistRequiredArguments =
    { input : Graphql.InputObject.InputGistItem }


{-|

  - input -

-}
saveGist :
    SaveGistRequiredArguments
    -> SelectionSet decodesTo Graphql.Object.GistItem
    -> SelectionSet decodesTo RootMutation
saveGist requiredArgs____ object____ =
    Object.selectionForCompositeField "saveGist" [ Argument.required "input" requiredArgs____.input Graphql.InputObject.encodeInputGistItem ] object____ Basics.identity


type alias DeleteGistRequiredArguments =
    { gistID : Graphql.ScalarCodecs.GistIdScalar }


{-|

  - gistID -

-}
deleteGist :
    DeleteGistRequiredArguments
    -> SelectionSet Graphql.ScalarCodecs.GistIdScalar RootMutation
deleteGist requiredArgs____ =
    Object.selectionForField "ScalarCodecs.GistIdScalar" "deleteGist" [ Argument.required "gistID" requiredArgs____.gistID (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapEncoder .codecGistIdScalar) ] (Graphql.ScalarCodecs.codecs |> Graphql.Scalar.unwrapCodecs |> .codecGistIdScalar |> .decoder)


type alias SaveSettingsRequiredArguments =
    { diagram : Graphql.Enum.Diagram.Diagram
    , input : Graphql.InputObject.InputSettings
    }


{-|

  - diagram -
  - input -

-}
saveSettings :
    SaveSettingsRequiredArguments
    -> SelectionSet decodesTo Graphql.Object.Settings
    -> SelectionSet decodesTo RootMutation
saveSettings requiredArgs____ object____ =
    Object.selectionForCompositeField "saveSettings" [ Argument.required "diagram" requiredArgs____.diagram (Encode.enum Graphql.Enum.Diagram.toString), Argument.required "input" requiredArgs____.input Graphql.InputObject.encodeInputSettings ] object____ Basics.identity
