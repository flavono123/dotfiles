def floatorinteger(v):
  v | tostring |
  if test("\\.") then
   {"type": "float"}
  else
   {"type": "integer"}
  end;

def dateortext(v):
  v |
  if test("\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}") then
    {"type": "date"}
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

def estype(v):
  if type=="number" then
    floatorinteger(v)
  elif type=="string" then
    dateortext(v)
  else
    type
  end;

def esprop(v):
  if type=="object" then
    {"properties":  v | with_entries(.value |= esprop(.))}
  else
    estype(v)
  end;

#with_entries(select(.key | test("offset|prospector|input|beat|fields|agent|@metadata") | not)) | walk(if type=="object" then to_entries | sort_by(.key) | from_entries else . end) |  with_entries(.value |= esprop(.))
