# input
.,

# first try

def list2keys(key; list): [ map({ key: key, list: list })
  | .[] | .key as $key | (.list // []) | map({ key: ., val: $key }) ] | add;

def combine:
  reduce .[] as $i
  (null; . + { ($i.key): (if has($i.key) then .[$i.key] + [$i.val] else [$i.val] end) });

list2keys(.id; .tags),
(list2keys(.id; .tags) | combine),

# https://github.com/stedolan/jq/pull/1103

def add_merge:
  reduce .[] as $i ({}; ($i | to_entries[]) as $e | .[$e.key] += $e.value);

def aggregate_add:
  reduce .[] as $o ({}; reduce ($o | keys[]) as $k (.; .[$k] += $o[$k]));

# second try

def iter(f): .[] | f;
def vk_pair(i; l): map(i as $_ | l? | iter({(.): [$_]}));

vk_pair(.id; .tags),
(vk_pair(.id; .tags) | add_merge),
(vk_pair(.id; .tags) | aggregate_add),

# third try

def lv2k(i; l): reduce map(i as $_ | l[]? | {k: ., v: [$_]})[] as $_ (null; .[$_.k] += $_.v);

lv2k(.id; .tags),
empty
