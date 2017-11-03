type action = Add | Sub

type state = {count: int; click: int; dummy: bool}

let component = ReasonReact.reducerComponent "Counter"

let make _children =
  { component with
    initialState= (fun () -> {count= 0; click= 0; dummy= false})
  ; reducer=
      (fun action state ->
        match action with
        | Sub ->
            ReasonReact.Update
              {state with count= state.count - 1; click= state.click + 1}
        | Add ->
            ReasonReact.Update
              {state with count= state.count + 1; click= state.click + 1})
  ; render=
      (fun self ->
        ReactDOMRe.createElement "div"
          [| ReactDOMRe.createElement "button"
               ~props:
                 (ReactDOMRe.props
                    ~onClick:(self.reduce (fun _event -> Sub))
                    ())
               [|ReasonReact.stringToElement "-"|]
          ; ReasonReact.stringToElement
              ("Clicks = " ^ string_of_int self.state.click)
          ; ReasonReact.stringToElement
              (" || Counter = " ^ string_of_int self.state.count)
          ; ReactDOMRe.createElement "button"
              ~props:
                (ReactDOMRe.props ~onClick:(self.reduce (fun _event -> Add)) ())
              [|ReasonReact.stringToElement "+"|] |]) }

