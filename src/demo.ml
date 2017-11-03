let () =
  ReactDOMRe.renderToElementWithId
    (ReasonReact.element (Page.make ~name:"Hello from OCaml React" [||]))
    "index"

