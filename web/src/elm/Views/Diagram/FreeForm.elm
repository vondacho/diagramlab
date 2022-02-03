module Views.Diagram.FreeForm exposing (view)

import Constants
import Models.Diagram as Diagram exposing (Model, MoveState, Msg)
import Models.Diagram.FreeForm as FreeForm exposing (FreeFormItem)
import Models.DiagramData as DiagramData
import Models.Item as Item exposing (Item)
import Svg.Styled as Svg exposing (Svg)
import Svg.Styled.Lazy as Lazy
import Views.Diagram.Views as Views
import Views.Empty as Empty


view : Model -> Svg Msg
view model =
    case model.data of
        DiagramData.FreeForm f ->
            Svg.g []
                (List.indexedMap
                    (formView model)
                    (FreeForm.getItems f)
                )

        _ ->
            Empty.view


moveingItem : MoveState -> Maybe Item
moveingItem state =
    case state of
        Diagram.ItemMove target ->
            case target of
                Diagram.ItemTarget item ->
                    Just item

                _ ->
                    Nothing

        _ ->
            Nothing



-- TODO: reversive


formView : Model -> Int -> FreeFormItem -> Svg Msg
formView model i item =
    case item of
        FreeForm.HorizontalLine item_ ->
            Views.horizontalLine
                { settings = model.settings
                , position =
                    ( 16 + modBy 4 i * (model.settings.size.width + 16)
                    , (i // 4) * (model.settings.size.height + 16)
                    )
                , selectedItem = model.selectedItem
                , item =
                    model.moveState
                        |> moveingItem
                        |> Maybe.map
                            (\v ->
                                if Item.getLineNo v == Item.getLineNo item_ then
                                    v

                                else
                                    item_
                            )
                        |> Maybe.withDefault item_
                }

        FreeForm.VerticalLine item_ ->
            Views.verticalLine
                { settings = model.settings
                , position =
                    ( 16 + modBy 4 i * (model.settings.size.width + 16)
                    , (i // 4) * (model.settings.size.height + 16)
                    )
                , selectedItem = model.selectedItem
                , item =
                    model.moveState
                        |> moveingItem
                        |> Maybe.map
                            (\v ->
                                if Item.getLineNo v == Item.getLineNo item_ then
                                    v

                                else
                                    item_
                            )
                        |> Maybe.withDefault item_
                }

        FreeForm.Card item_ ->
            Svg.g [] <|
                Views.card
                    { settings = model.settings
                    , property = model.property
                    , position =
                        ( 16 + modBy 4 i * (model.settings.size.width + 16)
                        , (i // 4) * (model.settings.size.height + 16)
                        )
                    , selectedItem = model.selectedItem
                    , item =
                        model.moveState
                            |> moveingItem
                            |> Maybe.map
                                (\v ->
                                    if Item.getLineNo v == Item.getLineNo item_ then
                                        v

                                    else
                                        item_
                                )
                            |> Maybe.withDefault item_
                    , canMove = True
                    }
                    :: (Item.indexedMap
                            (\i_ childItem ->
                                Views.card
                                    { settings = model.settings
                                    , property = model.property
                                    , position =
                                        ( 16 + modBy 4 i * (model.settings.size.width + 16)
                                        , (i + i_ + 1) * (model.settings.size.height + 16)
                                        )
                                    , selectedItem = model.selectedItem
                                    , item =
                                        model.moveState
                                            |> moveingItem
                                            |> Maybe.map
                                                (\v ->
                                                    if Item.getLineNo v == Item.getLineNo childItem then
                                                        v

                                                    else
                                                        childItem
                                                )
                                            |> Maybe.withDefault childItem
                                    , canMove = True
                                    }
                            )
                        <|
                            (item_
                                |> Item.getChildren
                                |> Item.unwrapChildren
                            )
                       )

        FreeForm.Canvas item_ ->
            Lazy.lazy6 Views.canvas
                model.settings
                model.property
                ( Constants.itemWidth, Constants.itemHeight )
                ( 0, 0 )
                model.selectedItem
                item_
