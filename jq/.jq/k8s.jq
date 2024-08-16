def base_path:
  ["spec", "versions", 0, "schema", "openAPIV3Schema", "properties", "spec", "properties"];

def build_properties_path(query):
  base_path + (
    reduce (query | split("."))[] as $part (
      [];
      if $part == "[]" then
        . + ["items"]
      elif $part | endswith("[]") then
        . + [($part | rtrimstr("[]")), "items", "properties"]
      else
        . + [$part, "properties"]
      end
    )
  )[:-1];


def find_default(query):
  getpath(build_properties_path(query)) | .default;
