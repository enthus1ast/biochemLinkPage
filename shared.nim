import strutils, json, times

type
  Dataset* = object
    name*: string
    link*: string
    image*: string

proc load*(): seq[Dataset] =
  for line in lines("datasets.jsonl"):
    if line.strip().startsWith("#"): continue
    result &= parseJson(line).to(Dataset)

proc currentYear*(): string =
  $now().year
