module RangeSlider exposing (..)

import Html exposing (Html, div, h1, header, img, text)
import Html.Attributes exposing (class, src, width)
import Mouse exposing (Position)


type alias Model =
    { min : Int
    , max : Int
    , from : Int
    , to : Int
    }


initialModel : Model
initialModel =
    { min = 0
    , max = 52
    , from = 1
    , to = 36
    }


type Msg
    = None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    text "Range Slider"


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
