use inc::Module::Install;

all_from       'lib/Text/Emoticon/Plurk.pm';
requires_from  'lib/Text/Emoticon/Plurk.pm';
readme_from    'lib/Text/Emoticon/Plurk.pm';

build_requires 'Test::More' => "0.88";

license        'mit';

auto_include_deps;
auto_install;

tests          't/*.t';

WriteAll;
