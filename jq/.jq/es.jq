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
  if type=="number" then
    floatorinteger
  elif type=="string" then
    dateorstring
  else
    { "type": type }
  end;

def esprop:
  if type=="object" then
    {"properties": with_entries(.value |= estype)}
  else
    estype
  end;
