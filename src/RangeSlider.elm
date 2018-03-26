module RangeSlider exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Mouse exposing (Position)


type alias Model =
    { mouse : { position : Position }
    , min : Int
    , max : Int
    , step : Float
    , stepWidth : Int
    , from : Int
    , to : Int
    }


initialModel : Model
initialModel =
    { mouse = { position = Position 0 0 }
    , min = 0
    , max = 52
    , step = 1
    , stepWidth = 10
    , from = 5
    , to = 29
    }


type Msg
    = None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ text "Range Slider"
        , br [] []
        , br [] []
        , slider model
        , br [] []
        , br [] []
        , br [] []
        , model |> toString |> text
        ]


slider model =
    let
        sliderWidth =
            toString <| model.max * model.stepWidth

        rangeLowButton =
            viewRangeLowButton model

        selectedBar =
            viewSelectedBar model

        rangeHighButton =
            viewRangeHighButton model
    in
    span [ class "range-slider", style [ ( "width", sliderWidth ++ "px" ) ] ]
        [ rangeLowButton
        , selectedBar
        , rangeHighButton
        ]


subscriptions =
    \_ -> Sub.none


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = init
        , subscriptions = subscriptions
        }


init =
    ( initialModel, Cmd.none )


viewSelectedBar model =
    let
        props =
            selectedPosition model
    in
    span
        [ class "selected"
        , style
            [ ( "width", toString props.width ++ "px" )
            , ( "left", toString props.left ++ "px" )
            ]
        ]
        [ text " " ]


selectedPosition { min, max, from, to, stepWidth } =
    { width = (to - from) * stepWidth
    , left = from * stepWidth
    }


viewRangeLowButton model =
    let
        props =
            rangeLowPosition model
    in
    span
        [ class "range-slider-button"
        , style
            [ ( "left", toString props.left ++ "px" ) ]
        ]
        [ text " " ]


rangeLowPosition { from, stepWidth } =
    { left = from * stepWidth
    }


viewRangeHighButton model =
    let
        props =
            rangeHighPosition model

        x =
            Debug.log "viewRangeHighButton" props
    in
    span
        [ class "range-slider-button"
        , style
            [ ( "left", toString props.left ++ "px" ) ]
        ]
        [ text " " ]


rangeHighPosition { min, max, from, to, stepWidth } =
    { left = to * stepWidth }
