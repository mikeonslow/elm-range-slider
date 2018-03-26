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
    , max = 30
    , step = 1
    , stepWidth = 20
    , from = 1
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
    in
    span [ class "range-slider", style [ ( "width", sliderWidth ++ "px" ) ] ]
        [ span [ class "range-slider-button" ] []
        , span [ class "selected", style [ ( "width", "200px" ) ] ] [ text " " ]
        , span [ class "range-slider-button" ] []
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
