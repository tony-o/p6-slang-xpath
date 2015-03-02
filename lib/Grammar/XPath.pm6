use Grammar::Tracer;

grammar Grammar::XPath;

rule TOP {
  ^
  [
    <separator>? <node> <match>*
  ]+
  $
};

rule separator {
  [ '//' | '/' ]
};

rule node {
  <-[\/\\\[\]]>+
};

rule match {
  '[' [ <criteria> <operands>**0..1 ]+ ']'
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
  <-[\[\]]>+ [ '=' <quotedstring> ] 
}

rule quotedstring {
  $<q>=[\'\"] .*? [ <!after \\> $<q> ] 
}
