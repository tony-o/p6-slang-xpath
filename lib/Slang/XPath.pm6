sub EXPORT(|) {
  use XPath::Grammar;
  use XPath::Actions;

  nqp::bindkey(%*LANG, 'MAIN', %*LANG<MAIN>.HOW.mixin(%*LANG<MAIN>, XPath::Grammar));
  nqp::bindkey(%*LANG, 'MAIN-actions', %*LANG<MAIN-actions>.HOW.mixin(%*LANG<MAIN-actions>, XPath::Actions));
  {}
};
