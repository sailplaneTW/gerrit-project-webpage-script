#!/usr/bin/env perl

use strict;

# === config ===
my $output_file = '';
my $gerrit_project_url = '';
my @project_list = (
    # gerrit project name list, such as'.repo/manifests',
);
# ==============


open FD, "> ./$output_file" || die('open result file failed');

# head
my $head_html = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"><head profile="http://selenium-ide.openqa.org/profiles/test-case"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><link rel="selenium.base" href="https://10.128.61.248/" /><title>gerrit change merge to cherry-pick script</title></head><body><table cellpadding="1" cellspacing="1" border="1"><thead><tr><td rowspan="1" colspan="3">gerrit change</td></tr></thead><tbody>';

# middle
my $middle_html = '';
for my $p (@project_list) {
    my $each_project_html = "<tr><td>open</td><td>$gerrit_project_url/#/admin/projects/$p</td><td></td></tr>";
    $each_project_html .= "<tr><td>waitForTitle</td><td>Project $p | 10.128 Code Review</td><td></td></tr>";
    $each_project_html .= "<tr><td>waitForTable</td><td>//div[".'@id='."'".'gerrit_body'."']/div/div/div/div/table[2].1.1</td><td>Fast Forward OnlyMerge if NecessaryRebase if NecessaryAlways MergeCherry Pick</td></tr>";
    $each_project_html .= "<tr><td>select</td><td>css=select.gwt-ListBox</td><td>label=Cherry Pick</td></tr><tr><td>waitForText</td><td>css=div.screen &gt; div &gt; button.gwt-Button</td><td>Save Changes</td></tr><tr><td>click</td><td>css=div.screen &gt; div &gt; button.gwt-Button</td><td></td></tr>";
    $middle_html .= $each_project_html;
}

#end
my $end_html = '</tbody></table></script></body></html>';

print FD $head_html.$middle_html.$end_html;
close FD;

