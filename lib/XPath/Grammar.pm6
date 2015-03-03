use Grammar::Tracer;

role XPath::Grammar;

#rule TOP {
#  ^
rule statement_control:sym<xpath> {
  <sym>
  [
    <separator>? <node> <match>*
  ]+
  $$
}
#  $
#};

rule separator {
  [ '//' | '/' ]
};

rule node {
  <-[\r\n\/\\\[\]]>+
};

rule match {
  '[' 
  [ 
    <criteria> 
    <operands>**0..1 
  ]+ 
  ']'
};

rule operands {
  [
    '|'
    | '&'
    | 'and'
    | 'or'
  ]
}

rule criteria {
  <-[\[\]\=]>+ 
  [ 
    '=' 
    [ 
      <quotedstring> 
      | $<number>=[\d+] 
    ] 
  ]**0..1 
}

token quotedstring {
  $<q>=['\'' | '"'] .*? [ <?!after '\\'> $<q> ]
}
