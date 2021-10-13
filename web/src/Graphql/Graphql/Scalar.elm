-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Graphql.Scalar exposing (Codecs, GistIdScalar(..), Id(..), ItemIdScalar(..), Time(..), defaultCodecs, defineCodecs, unwrapCodecs, unwrapEncoder)

import Graphql.Codec exposing (Codec)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode
import Json.Decode as Decode
import Json.Encode as Encode


type GistIdScalar
    = GistIdScalar String


type Id
    = Id String


type ItemIdScalar
    = ItemIdScalar String


type Time
    = Time String


defineCodecs :
    { codecGistIdScalar : Codec valueGistIdScalar
    , codecId : Codec valueId
    , codecItemIdScalar : Codec valueItemIdScalar
    , codecTime : Codec valueTime
    }
    -> Codecs valueGistIdScalar valueId valueItemIdScalar valueTime
defineCodecs definitions =
    Codecs definitions


unwrapCodecs :
    Codecs valueGistIdScalar valueId valueItemIdScalar valueTime
    ->
        { codecGistIdScalar : Codec valueGistIdScalar
        , codecId : Codec valueId
        , codecItemIdScalar : Codec valueItemIdScalar
        , codecTime : Codec valueTime
        }
unwrapCodecs (Codecs unwrappedCodecs) =
    unwrappedCodecs


unwrapEncoder :
    (RawCodecs valueGistIdScalar valueId valueItemIdScalar valueTime -> Codec getterValue)
    -> Codecs valueGistIdScalar valueId valueItemIdScalar valueTime
    -> getterValue
    -> Graphql.Internal.Encode.Value
unwrapEncoder getter (Codecs unwrappedCodecs) =
    (unwrappedCodecs |> getter |> .encoder) >> Graphql.Internal.Encode.fromJson


type Codecs valueGistIdScalar valueId valueItemIdScalar valueTime
    = Codecs (RawCodecs valueGistIdScalar valueId valueItemIdScalar valueTime)


type alias RawCodecs valueGistIdScalar valueId valueItemIdScalar valueTime =
    { codecGistIdScalar : Codec valueGistIdScalar
    , codecId : Codec valueId
    , codecItemIdScalar : Codec valueItemIdScalar
    , codecTime : Codec valueTime
    }


defaultCodecs : RawCodecs GistIdScalar Id ItemIdScalar Time
defaultCodecs =
    { codecGistIdScalar =
        { encoder = \(GistIdScalar raw) -> Encode.string raw
        , decoder = Object.scalarDecoder |> Decode.map GistIdScalar
        }
    , codecId =
        { encoder = \(Id raw) -> Encode.string raw
        , decoder = Object.scalarDecoder |> Decode.map Id
        }
    , codecItemIdScalar =
        { encoder = \(ItemIdScalar raw) -> Encode.string raw
        , decoder = Object.scalarDecoder |> Decode.map ItemIdScalar
        }
    , codecTime =
        { encoder = \(Time raw) -> Encode.string raw
        , decoder = Object.scalarDecoder |> Decode.map Time
        }
    }
