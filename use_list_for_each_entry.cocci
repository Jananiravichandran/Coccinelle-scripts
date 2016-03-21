@a@
expression n, head, tmp;
expression mem;
type t;
identifier var;
struct list_head *pos;
iterator name list_for_each_entry, list_for_each_entry_safe;
iterator name list_for_each, list_for_each_safe;
@@

(
- list_for_each(pos, head)
+ list_for_each_entry(var, head, mem)
  {
   ... when != var
-  var = \(list_entry \| container_of\)(pos, t, mem);
   ... when != pos   
  } 
|
- list_for_each_safe(pos, n, head) 
+ list_for_each_entry_safe(var, n, head, mem) 
 {
  ... when != var
- var = \(list_entry \| container_of\)(pos, t, mem);
  ... when != pos 
 }
)
