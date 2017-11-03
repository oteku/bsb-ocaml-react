let component = ReasonReact.statelessComponent "Page"

let make ~name _children =
  { component with
    render=
      (fun _self ->
        ReactDOMRe.createElement "div"
          [| ReactDOMRe.createElement "h1" [|ReasonReact.stringToElement name|]
          ; ReasonReact.element (Counter.make [||]) |]) }

          