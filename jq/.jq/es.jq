def floatorinteger:
  if tostring | test("\\.") then
    { "type": "float" }
  else
    { "type": "integer" }
  end;

def dateorstring:
  if test("\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}") then
    { "type": "date" }
  else
    {
      "type": "text",
      "fields": {
        "keyword": {
          "type": "keyword",
          "ignore_above": 256
        }
      }
    }
  end;

def estype:
  if type=="object" then
    {"properties": with_entries(.value |= estype)}
  elif type=="number" then
    floatorinteger
  elif type=="string" then
    dateorstring
  else
    { "type": type }
  end;

def prop:
  with_entries(select(.key | test("offset|prospector|input|beat|fields|agent|@metadata") | not)) |
  {
    "properties": with_entries(.value |= estype)
  };
