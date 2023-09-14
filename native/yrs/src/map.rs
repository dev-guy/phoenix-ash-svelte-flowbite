use lib0::any;
use yrs::{Doc, Map, MapPrelim, Transact};
use yrs::types::ToJson;

fn main() {
const doc:Doc = Doc::new();
let map = doc.get_or_insert_map("map");
static mut txn = doc.transact_mut();

// insert value
map.insert(&mut txn, "key1", "value1");

// insert nested shared type
let nested = map.insert(&mut txn, "key2", MapPrelim::from([("inner", "value2")]));
nested.insert(&mut txn, "inner2", 100);

assert_eq!(map.to_json(&txn), any!({
  "key1": "value1",
  "key2": {
    "inner": "value2",
    "inner2": 100
  }
}));

// get value
assert_eq!(map.get(&txn, "key1"), Some("value1".into()));

// remove entry
map.remove(&mut txn, "key1");
assert_eq!(map.get(&txn, "key1"), None);
}

