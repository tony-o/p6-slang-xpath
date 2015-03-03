use lib 'lib';
use Grammar::XPath;

for 'xp.xpath'.IO.lines -> $l {
  $l.say;
  say (Grammar::XPath.parse($l) ?? 'pass' !! 'fail');
}
