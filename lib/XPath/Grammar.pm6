use Grammar::Tracer;

grammar XPath::Grammar {

  token TOP { <path> }

  proto token statement_control {*}
  token statement_control:sym<xpath> {
    <sym>
    <path>
  }

  token path { [<separator>? <node> <match>*]+ <.ws>? $$ }

  token separator { [ '//' || '/' ] }

  token node  { <-[\r\n\/\\\[\]]>+ }

  token match {
    '[' 
    [ 
      <criteria> 
      <operands>**0..1 
    ]+ 
    ']'
  }

  token operands {
    [
      || '|'
      || '&'
      || 'and'
      || 'or'
    ]
  }

  token criteria {
    <-[\[\]\=]>+ 
    [ 
      '=' 
      [ 
        || <quotedstring> 
        || $<number>=[\d+] 
      ] 
    ]**0..1 
  }

  token quotedstring { 
    $<q>=<['"]> 
    (.*?) 
    [ <!after '\\'> $<q> ] 
  }

}