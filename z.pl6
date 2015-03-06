use lib 'lib';
use XPath::Grammar;

for 'xp.xpath'.IO.lines -> $l {
  $l.say;
  say (XPath::Grammar.parse($l) ?? 'pass' !! 'fail');
}
