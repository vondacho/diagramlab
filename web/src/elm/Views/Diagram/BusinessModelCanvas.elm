module Views.Diagram.BusinessModelCanvas exposing (view)

import Constants exposing (..)
import Html exposing (div)
import Html.Attributes as Attr
import List.Extra exposing (getAt)
import Models.Diagram exposing (Model, Msg(..), Settings)
import Models.Item as Item exposing (Children, Item, ItemType(..))
import String
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (..)
import Svg.Lazy exposing (..)


view : Model -> Svg Msg
view model =
    let
        drawItems =
            model.items |> List.filter (\item -> item.itemType /= Comments)

        itemHeight =
            Basics.max Constants.itemHeight (14 * (List.maximum model.countByTasks |> Maybe.withDefault 0))
    in
    g
        [ transform
            ("translate("
                ++ String.fromInt model.x
                ++ ","
                ++ String.fromInt model.y
                ++ ")"
            )
        , fill "#F5F5F6"
        ]
        [ -- Key Partners
          canvasView model.settings
            Constants.itemWidth
            (itemHeight * 2)
            "0"
            "0"
            (drawItems
                |> getAt 0
                |> Maybe.withDefault
                    { lineNo = 0
                    , text = ""
                    , comment = Nothing
                    , itemType = Activities
                    , children = Item.empty
                    }
            )

        -- Key Activities
        , canvasView model.settings
            Constants.itemWidth
            itemHeight
            (String.fromInt (Constants.itemWidth - 5))
            "0"
            (drawItems
                |> getAt 3
                |> Maybe.withDefault
                    { lineNo = 0
                    , text = ""
                    , comment = Nothing
                    , itemType = Activities
                    , children = Item.empty
                    }
            )

        -- Key Resources
        , canvasView model.settings
            Constants.itemWidth
            (itemHeight + 5)
            (String.fromInt (Constants.itemWidth - 5))
            (String.fromInt (itemHeight - 5))
            (drawItems
                |> getAt 7
                |> Maybe.withDefault
                    { lineNo = 0
                    , text = ""
                    , comment = Nothing
                    , itemType = Activities
                    , children = Item.empty
                    }
            )

        -- Value Propotion
        , canvasView model.settings
            Constants.itemWidth
            (itemHeight * 2)
            (String.fromInt (Constants.itemWidth * 2 - 10))
            "0"
            (drawItems
                |> getAt 2
                |> Maybe.withDefault
                    { lineNo = 0
                    , text = ""
                    , comment = Nothing
                    , itemType = Activities
                    , children = Item.empty
                    }
            )

        -- ️Customer Relationships
        , canvasView model.settings
            Constants.itemWidth
            itemHeight
            (String.fromInt (Constants.itemWidth * 3 - 15))
            "0"
            (drawItems
                |> getAt 8
                |> Maybe.withDefault
                    { lineNo = 0
                    , text = ""
                    , comment = Nothing
                    , itemType = Activities
                    , children = Item.empty
                    }
            )

        -- Channels
        , canvasView model.settings
            Constants.itemWidth
            (itemHeight + 5)
            (String.fromInt (Constants.itemWidth * 3 - 15))
            (String.fromInt (itemHeight - 5))
            (drawItems
                |> getAt 4
                |> Maybe.withDefault
                    { lineNo = 0
                    , text = ""
                    , comment = Nothing
                    , itemType = Activities
                    , children = Item.empty
                    }
            )

        -- Customer Segments
        , canvasView model.settings
            Constants.itemWidth
            (itemHeight * 2)
            (String.fromInt (Constants.itemWidth * 4 - 20))
            "0"
            (drawItems
                |> getAt 1
                |> Maybe.withDefault
                    { lineNo = 0
                    , text = ""
                    , comment = Nothing
                    , itemType = Activities
                    , children = Item.empty
                    }
            )

        -- Cost Structure
        , canvasView model.settings
            (round (toFloat Constants.itemWidth * 2.5) - 5)
            (itemHeight + 5)
            "0"
            (String.fromInt (itemHeight * 2 - 5))
            (drawItems
                |> getAt 6
                |> Maybe.withDefault
                    { lineNo = 0
                    , text = ""
                    , comment = Nothing
                    , itemType = Activities
                    , children = Item.empty
                    }
            )

        -- Revenue Streams
        , canvasView model.settings
            (round (toFloat Constants.itemWidth * 2.5) - 5)
            (itemHeight + 5)
            (String.fromInt (round (toFloat Constants.itemWidth * 2.5) - 15))
            (String.fromInt (itemHeight * 2 - 5))
            (drawItems
                |> getAt 5
                |> Maybe.withDefault
                    { lineNo = 0
                    , text = ""
                    , comment = Nothing
                    , itemType = Activities
                    , children = Item.empty
                    }
            )
        ]


canvasView : Settings -> Int -> Int -> String -> String -> Item -> Svg Msg
canvasView settings svgWidth svgHeight posX posY item =
    let
        lines =
            List.map (\i -> i.text) (Item.unwrapChildren item.children)
    in
    svg
        [ width (String.fromInt svgWidth)
        , height (String.fromInt svgHeight)
        , x posX
        , y posY
        ]
        [ g []
            [ rectView (String.fromInt svgWidth) (String.fromInt svgHeight) settings.color.line
            , titleView settings 10 10 item.text
            , textView settings (Constants.itemWidth - 13) svgHeight 10 35 lines
            ]
        ]


rectView : String -> String -> String -> Svg Msg
rectView w h color =
    rect
        [ width w
        , height h
        , stroke color
        , strokeWidth "10"
        ]
        []


titleView : Settings -> Int -> Int -> String -> Svg Msg
titleView settings posX posY title =
    text_
        [ x (String.fromInt posX)
        , y (String.fromInt (posY + 14))
        , fontFamily settings.font
        , fill settings.color.label
        , fontSize "16"
        , fontWeight "bold"
        , class "svg-text"
        ]
        [ text title ]


textView : Settings -> Int -> Int -> Int -> Int -> List String -> Svg Msg
textView settings w h posX posY lines =
    g []
        [ foreignObject
            [ x (String.fromInt posX)
            , y (String.fromInt posY)
            , width (String.fromInt w)
            , height (String.fromInt h)
            , color settings.color.comment.color
            , fontSize "14"
            , fontFamily settings.font
            , class "svg-text"
            ]
            (lines
                |> List.map
                    (\line ->
                        div
                            [ Attr.style "font-family" ("'" ++ settings.font ++ "', sans-serif")
                            , Attr.style "word-wrap" "break-word"
                            , Attr.style "margin-bottom" "8px"
                            ]
                            [ Html.text line ]
                    )
            )
        ]
