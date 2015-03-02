use lib 'lib';
use Grammar::XPath;

for 'xp.xpath'.IO.lines -> $l {
  $l.say;
  say Nil ~~ Grammar::XPath.parse($l) ?? 'pass' !! 'fail';
}
