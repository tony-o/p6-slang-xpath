role XPath::Actions;

sub Slang::XPath::xpath(Str $xpath) is export {

}

sub lk(Mu \h, \k) { 
  nqp::atkey(nqp::findmethod(h, 'hash')(h), k); 
}

method statement_control:sym<xpath>(Mu $/ is rw) {
  my @separator = lk($/, 'separator');
  my @selectors = lk($/, 'node');
  my $i = 0;
  my $f = @separator.elems() == @selectors.elems() ?? 0 !! -1;
  say 'PARSED';
  while $i < @selectors.elems() {
    say 'SEP: ' ~ ($i + $f < 0 ?? '//' !! @separator[$i + $f].Str);
    say 'SEL: ' ~ @selectors[$i].Str;
    $i++;
  }
#  my $block = QAST::op.new(
#    :op<call>,
#    :name<&Slang::XPath::xpath>,
#    QAST::SVal.new(:value($xpath.Str)),
#    (),
#    {}
#  );
}


